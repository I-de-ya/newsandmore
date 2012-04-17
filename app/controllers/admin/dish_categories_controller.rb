#coding: utf-8
class Admin::DishCategoriesController < Admin::ApplicationController
  # GET /categories
  # GET /categories.json
  before_filter :get_section

  def index
    @page_title = "Категории блюд"
    @categories = @section.dish_categories
    @images = @section.images

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def sort
    params[:pos].each_with_index do |id, idx|
      p = @section.dish_categories.find(id)
      p.position = idx
      p.save
    end
    render :nothing => true
  end 

  def toggleshow
    @category = @section.dish_categories.find(params[:id])
    @category.toggle(:visible)
    @category.save
    redirect_to :back, notice: 'Категория обновлена.'
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = @section.dish_categories.build


    respond_to do |format|
      format.html { render "edit"}
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @page_title = "Редактирование категории блюд"
    @category = @section.dish_categories.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = @section.dish_categories.build(params[:dish_category])
      if @category.save
        redirect_to (params[:commit] == "Сохранить" ? [:admin, @section, :dish_categories] : [:edit, :admin, @section, @category]), notice: 'Категория успешно добавлена.'
      else
        render action: "edit"
      end

  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = @section.dish_categories.find(params[:id])
      if @category.update_attributes(params[:dish_category])
        redirect_to (params[:commit] == "Сохранить" ? [:admin, @section, :dish_categories] : [:edit, :admin, @section, @category]), notice: 'Категория успешно обновлена.'
      else
        render action: "edit"

      end

  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = DishCategory.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Категория удалена.' }
      format.json { head :no_content }
    end
  end

  def get_section
    @section = Section.find(params[:section_id])
  end
end
