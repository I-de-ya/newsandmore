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
  end
end