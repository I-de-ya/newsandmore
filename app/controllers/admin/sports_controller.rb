#coding: utf-8
class Admin::SportsController < Admin::ApplicationController
  def toggleshow
    @sport = Sport.find(params[:id])
    @sport.toggle(:show)
    @sport.save
    redirect_to :back, notice: 'Вид спорта обновлен.'
  end

  def index
    @page_title = "Виды спорта"
    @sports = Sport.all
  end

  def new
    @sport = Sport.new
    render "edit"
  end

  def create
    
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    
  end

  def show
    
  end

  def destroy
  end
end