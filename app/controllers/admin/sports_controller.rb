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
    @sport = Sport.find(params[:id])
    @sport.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:sports], notice: 'Вид спорта удален.' }
      format.json { head :no_content }
    end
  end
end