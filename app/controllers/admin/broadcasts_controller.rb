#coding: utf-8
class Admin::BroadcastsController < Admin::ApplicationController
  def toggleshow
    @broadcast = Broadcast.find(params[:id])
    @broadcast.toggle(:show)
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
    
  end

  def edit
    @broadcast = Broadcast.find(params[:id])
  end

  def update
    
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