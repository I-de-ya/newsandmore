# coding:utf-8
class SectionsController < ApplicationController

  def show
    @section = Section.find(params[:id])
    @title = @section.title
    @sections = Section.visible
    @text_banquets = Text.find_by_title("Информация для проведения банкетов")
    @text_thanks = Text.find_by_title("Благодарность за бронирование")
    @reservation = Reservation.new
    @recall = Recall.new
    @recalls = Recall.all
    @message = Message.new
    @positive_recalls = Recall.positive.length
    @negative_recalls = Recall.negative.length

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section }
    end
  end
end
