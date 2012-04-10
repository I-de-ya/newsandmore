#coding: utf-8
class Admin::SlidersController < Admin::ApplicationController
  # GET /sliders
  # GET /sliders.json
  def index
    @page_title = "Слайдер"
    @sliders = Slider.order("position ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sliders }
    end
  end
  
  def active
    @slider = Slider.where(:active => true).first
    if @slider
      @slider.active = false
      @slider.save
    end
    @slider = Slider.find(params[:id])
    @slider.active = true
    @slider.save
    redirect_to :back, notice: 'Слайдер обновлен.'    
  end

  def sort
    params[:pos].each_with_index do |id, idx|
      p = Slider.find(id)
      p.position = idx
      p.save
    end
    render :nothing => true
  end 

  def toggleshow
    @slider = Slider.find(params[:id])
    @slider.toggle(:visible)
    @slider.save
    redirect_to :back, notice: 'Слайдер обновлен.'
  end

  # GET /sliders/new
  # GET /sliders/new.json
  def new
    @slider = Slider.new

    respond_to do |format|
      format.html { render "edit" }
      format.json { render json: @slider }
    end
  end

  # GET /sliders/1/edit
  def edit
    @page_title = "Редактирование картинок на слайдер"
    @slider = Slider.find(params[:id])
  end

  # POST /sliders
  # POST /sliders.json
  def create
    @slider = Slider.new(params[:slider])

    respond_to do |format|
      if @slider.save
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:sliders] : [:edit,:admin,@slider]), notice: 'Слайдер успешно создан.' }
        format.json { render json: @slider, status: :created, location: @slider }
      else
        format.html { render action: "new" }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sliders/1
  # PUT /sliders/1.json
  def update
    @slider = Slider.find(params[:id])

    respond_to do |format|
      if @slider.update_attributes(params[:slider])
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:sliders] : [:edit,:admin,@slider]), notice: 'Слайдер успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sliders/1
  # DELETE /sliders/1.json
  def destroy
    @slider = Slider.find(params[:id])
    @slider.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:sliders], notice: "Слайдер удален." }
      format.json { head :no_content }
    end
  end
end
