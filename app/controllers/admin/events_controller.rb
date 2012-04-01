#coding: utf-8
class Admin::EventsController < Admin::ApplicationController
  def toggleshow
    @event = Event.find(params[:id])
    @event.toggle(:show)
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

  def create
    
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    
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