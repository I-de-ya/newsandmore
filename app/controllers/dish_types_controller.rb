class DishTypesController < ApplicationController
  # GET /dish_types
  # GET /dish_types.json
  def index
    @dish_types = DishType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dish_types }
    end
  end

  # GET /dish_types/1
  # GET /dish_types/1.json
  def show
    @dish_type = DishType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dish_type }
    end
  end

  # GET /dish_types/new
  # GET /dish_types/new.json
  def new
    @dish_type = DishType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dish_type }
    end
  end

  # GET /dish_types/1/edit
  def edit
    @dish_type = DishType.find(params[:id])
  end

  # POST /dish_types
  # POST /dish_types.json
  def create
    @dish_type = DishType.new(params[:dish_type])

    respond_to do |format|
      if @dish_type.save
        format.html { redirect_to @dish_type, notice: 'Dish type was successfully created.' }
        format.json { render json: @dish_type, status: :created, location: @dish_type }
      else
        format.html { render action: "new" }
        format.json { render json: @dish_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dish_types/1
  # PUT /dish_types/1.json
  def update
    @dish_type = DishType.find(params[:id])

    respond_to do |format|
      if @dish_type.update_attributes(params[:dish_type])
        format.html { redirect_to @dish_type, notice: 'Dish type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dish_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_types/1
  # DELETE /dish_types/1.json
  def destroy
    @dish_type = DishType.find(params[:id])
    @dish_type.destroy

    respond_to do |format|
      format.html { redirect_to dish_types_url }
      format.json { head :no_content }
    end
  end
end
