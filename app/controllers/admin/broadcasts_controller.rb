#coding: utf-8
class Admin::BroadcastsController < Admin::ApplicationController
  def toggleshow
    @broadcast = Broadcast.find(params[:id])
    @broadcast.toggle(:visible)
    @broadcast.save
    redirect_to :back, notice: 'Трансляция обновлена.'
  end

  def index
    @page_title = "Трансляции"
    @broadcasts = Broadcast.all
  end

  def new
    @broadcast = Broadcast.new
    render "edit"
  end

  def create
    @broadcast = Broadcast.new(params[:broadcast])

    respond_to do |format|
      if @broadcast.save
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:broadcasts] : [:edit,:admin,@broadcast]), notice: 'Трансляция успешно добавлена.' }
        format.json { render json: @broadcast, status: :created, location: @broadcast }
      else
        format.html { render action: "edit" }
        format.json { render json: @broadcast.errors, status: :unprocessable_entity }
      end
    end    
  end

  def edit
    @broadcast = Broadcast.find(params[:id])
  end

  def update
    @broadcast = Broadcast.find(params[:id])

    respond_to do |format|
      if @broadcast.update_attributes(params[:broadcast])
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:broadcasts] : [:edit,:admin,@broadcast]), notice: 'Трансляция успешно обновлена.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @broadcast.errors, status: :unprocessable_entity }
      end
    end    
  end

  def show
    
  end

  def destroy
    @broadcast = Broadcast.find(params[:id])
    @broadcast.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:broadcasts], notice: "Трансляция удалена" }
      format.json { head :no_content }
    end
  end
end