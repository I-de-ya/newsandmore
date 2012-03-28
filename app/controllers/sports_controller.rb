class SportsController < ApplicationController

  def show
    @sport = Sport.find(params[:id])
    @archive = Event.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sport }
    end
  end
  
end
