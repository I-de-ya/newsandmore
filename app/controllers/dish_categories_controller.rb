class DishCategoriesController < ApplicationController
  # GET /dish_categories
  # GET /dish_categories.json
  def index
    @dish_categories = DishCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dish_categories }
    end
  end

  # GET /dish_categories/1
  # GET /dish_categories/1.json
  def show
    @dish_category = DishCategory.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dish_category }
    end
  end

  # GET /dish_categories/new
  # GET /dish_categories/new.json
  def new
    @dish_category = DishCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dish_category }
    end
  end

  # GET /dish_categories/1/edit
  def edit
    @dish_category = DishCategory.find(params[:id])
  end

  # POST /dish_categories
  # POST /dish_categories.json
  def create
    @dish_category = DishCategory.new(params[:dish_category])

    respond_to do |format|
      if @dish_category.save
        format.html { redirect_to @dish_category, notice: 'Dish category was successfully created.' }
        format.json { render json: @dish_category, status: :created, location: @dish_category }
      else
        format.html { render action: "new" }
        format.json { render json: @dish_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dish_categories/1
  # PUT /dish_categories/1.json
  def update
    @dish_category = DishCategory.find(params[:id])

    respond_to do |format|
      if @dish_category.update_attributes(params[:dish_category])
        format.html { redirect_to @dish_category, notice: 'Dish category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dish_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_categories/1
  # DELETE /dish_categories/1.json
  def destroy
    @dish_category = DishCategory.find(params[:id])
    @dish_category.destroy

    respond_to do |format|
      format.html { redirect_to dish_categories_url }
      format.json { head :no_content }
    end
  end
end
