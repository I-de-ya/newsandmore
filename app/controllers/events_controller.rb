# coding: utf-8
class EventsController < ApplicationController

  def show

    @archive = Event.all
    @event = Event.find(params[:id])
    @title = "#{@event.title}"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

end
