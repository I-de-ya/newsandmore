#coding: utf-8
class Admin::DishCategoriesController < Admin::ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    @categories = Section.find(params[:section_id]).dish_categories

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def sort
    params[:pos].each_with_index do |id, idx|
      p = DishCategory.find(id)
      p.position = idx
      p.save
    end
    render :nothing => true
  end 

  def toggleshow
    @category = DishCategory.find(params[:id])
    @category.toggle(:visible)
    @category.save
    redirect_to :back, notice: 'Категория обновлена.'
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = DishCategory.new
    @section = Section.find(params[:section_id])

    respond_to do |format|
      format.html { render "edit"}
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = DishCategory.find(params[:id])
    @section = Section.find(params[:section_id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = DishCategory.new(params[:dish_category])
    @category.section_id = params[:section_id].to_i
    
      if @category.save
        redirect_to (params[:commit] == "Сохранить" ? [:admin,@category.section,:dish_categories] : [:edit,:admin,@category.section,@category]), notice: 'Категория успешно добавлена.'
      else
        render action: "edit"
      end

  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = DishCategory.find(params[:id])


      if @category.update_attributes(params[:dish_category])
        redirect_to (params[:commit] == "Сохранить" ? [:admin,@category.section,:dish_categories] : [:edit,:admin,@category.section,@category]), notice: 'Категория успешно обновлена.'
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
end
