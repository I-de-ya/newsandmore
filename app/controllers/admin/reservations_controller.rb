#coding: utf-8
class Admin::ReservationsController < Admin::ApplicationController
  def toggleshow
    @reservation = Reservation.find(params[:id])
    @reservation.toggle(:visible)
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

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(params[:reservation])

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to [:edit,:admin,@reservation], notice: 'Бронирование успешно добавлено.' }
        format.json { render json: @reservation, status: :created, location: @reservation }
      else
        format.html { render action: "edit" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to [:edit,:admin,@reservation], notice: 'Бронирование успешно обновлено.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:reservations], notice: 'Бронь удалена.' }
      format.json { head :no_content }
    end
  end
end