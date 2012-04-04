#coding: utf-8
class Admin::SectionsController < Admin::ApplicationController
    # GET /sections
    # GET /sections.json
  def index
    @sections = Section.order(:position)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sections }
    end
  end

  def sort
    params[:pos].each_with_index do |id, idx|
      p = Section.find(id)
      p.position = idx
      p.save
    end
    render :nothing => true
  end 

  def toggleshow
    @section = Section.find(params[:id])
    @section.toggle(:visible)
    @section.save
    redirect_to :back, notice: 'Раздел обновлен.'
  end
  
  def new
    @section = Section.new

    respond_to do |format|
      format.html { render "edit"}
      format.json { render json: @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:sections] : [:edit,:admin,@section]), notice: 'Раздел успешно добавлен.' }
        format.json { render json: @section, status: :created, location: @section }
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:sections] : [:edit,:admin,@section]), notice: 'Раздел успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:sections], notice: 'Раздел удален.' }
      format.json { head :no_content }
    end
  end
 
end

