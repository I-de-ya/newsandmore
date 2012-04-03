#coding: utf-8
class Admin::SportsController < Admin::ApplicationController
  def toggleshow
    @sport = Sport.find(params[:id])
    @sport.toggle(:visible)
    @sport.save
    redirect_to :back, notice: 'Вид спорта обновлен.'
  end

  def index
    @page_title = "Виды спорта"
    @sports = Sport.all
  end

  def new
    @sport = Sport.new
    render "edit"
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def create
    @sport = Sport.new(params[:sport])

    respond_to do |format|
      if @sport.save
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:sports] : [:edit,:admin,@sport]), notice: 'Вид спорта успешно добавлен.' }
        format.json { render json: @sport, status: :created, location: @sport }
      else
        format.html { render action: "edit" }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sports/1
  # PUT /sports/1.json
  def update
    @sport = Sport.find(params[:id])

    respond_to do |format|
      if @sport.update_attributes(params[:sport])
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:sports] : [:edit,:admin,@sport]), notice: 'Вид спорта успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def destroy
    @sport = Sport.find(params[:id])
    @sport.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:sports], notice: 'Вид спорта удален.' }
      format.json { head :no_content }
    end
  end
end