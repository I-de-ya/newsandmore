#coding: utf-8
class Admin::MoviesController < Admin::ApplicationController
  def toggleshow
    @movie = Movie.find(params[:id])
    @movie.toggle(:show)
    @movie.save
    redirect_to :back, notice: 'Кино обновлено.'
  end

  def index
    @page_title = "Cобытия"
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    render "edit"
  end

  def create
    
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    
  end

  def show
    
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:movies], notice: "Киношка удалена" }
      format.json { head :no_content }
    end
  end
end