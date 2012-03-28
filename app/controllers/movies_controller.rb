# coding: utf-8
class MoviesController < ApplicationController

  def show

  @movie = Movie.find(params[:id])
	@archive = Event.all
  @title = "#{@movie.title}"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end
end
