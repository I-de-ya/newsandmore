#coding: utf-8
class Admin::EventsController < Admin::ApplicationController
  def toggleshow
    @event = Event.find(params[:id])
    @event.toggle(:visible)
    @event.save
    redirect_to :back, notice: 'Событие обновлено.'
  end

  def index
    @page_title = "Cобытия"
    @events = Event.all
  end

  def new
    @event = Event.new
    render "edit"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:events] : [:edit,:admin,@event]), notice: 'Мероприятие успешно добавлено.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:events] : [:edit,:admin,@event]), notice: 'Мероприятие успешно обновлено.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:events], notice: "Событие удалено" }
      format.json { head :no_content }
    end
  end
end