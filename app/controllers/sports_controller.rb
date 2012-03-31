class SportsController < ApplicationController

  def show
  	@sections = Section.all
    @sport = Sport.find(params[:id])
    @broadcasts = @sport.broadcasts.where('showtime > ?', Date.today)
    @archive = Event.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sport }
    end
  end
  
end
