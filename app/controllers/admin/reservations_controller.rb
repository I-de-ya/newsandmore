#coding: utf-8
class Admin::ReservationsController < Admin::ApplicationController
  def toggleshow
    @reservation = Reservation.find(params[:id])
    @reservation.toggle(:show)
    @reservation.save
    redirect_to :back, notice: 'Бронирование обновлено'
  end

  def index
    @page_title = "Бронирование"
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    render "edit"
  end

  def create
    
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    
  end

  def show
    
  end

  def destroy
  end
end