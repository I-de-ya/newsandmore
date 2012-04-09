# coding: utf-8
class ReservationsController < ApplicationController

  def new
    @title = "On-Line бронирование"
    @reservation = Reservation.new
    @sliders = [Slider.first]
    @text_banquets = Text.find_by_title("Информация для проведения банкетов")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reservation }
    end
  end

  def create
    @reservation = Reservation.new(params[:reservation])
    @section = Section.find_by_title('On-line бронирование')
    @sections = Section.visible
    @text_banquets = Note.find_by_title("Информация для проведения банкетов")
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to section_path(@section), notice: 'Reservation was successfully created.' }
        format.json { render json: @reservation, status: :created, location: @reservation }
      else
        format.html { render 'sections/show' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

end
