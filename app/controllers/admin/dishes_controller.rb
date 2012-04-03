#coding: utf-8
class Admin::DishesController < Admin::ApplicationController
  before_filter :get_category
  # GET /dishes
  # GET /dishes.json
  def index
    if params[:dish_category_id]
      @dishes = Dish.where(:dish_category_id => params[:dish_category_id]).order("visible DESC, position")
    else
      @dishes = Dish.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dishes }
    end
  end

  def visible
    @dish = Dish.find(params[:id])
    @dish.toggle(:visible)
    @dish.save
    redirect_to :back, notice: 'Блюдо обновлено.'
  end 

  def sort
    params[:pos].each_with_index do |id, idx|
      p = Dish.find(id)
      p.position = idx
      p.save
    end
    render :nothing => true
  end 

  def toggleshow
    @dish = Dish.find(params[:id])
    @dish.toggle(:visible)
    @dish.save
    redirect_to :back, notice: 'Блюдо обновлено.'
  end

  # GET /dishes/new
  # GET /dishes/new.json
  def new
    @dish = Dish.new

    respond_to do |format|
      format.html { render "edit" }
      format.json { render json: @dish }
    end
  end

  # GET /dishes/1/edit
  def edit
    @dish = Dish.find(params[:id])
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(params[:dish])

      if @dish.save
        redirect_to (params[:commit] == "Сохранить" ? [:admin,@dish.dish_category.section,@dish.dish_category,:dishes] : [:edit,:admin,@dish.dish_category.section,@dish.dish_category,@dish]), notice: 'Блюдо успешно добавлено.'
      else
        render action: "edit"
      end
  end

  # PUT /dishes/1
  # PUT /dishes/1.json
  def update
    #render :inline => "<%= debug params[:dish] %>"
    @dish = Dish.find(params[:id])


      if @dish.update_attributes(params[:dish])
        redirect_to (params[:commit] == "Сохранить" ? [:admin,@dish.dish_category.section,@dish.dish_category,:dishes] : [:edit,:admin,@dish.dish_category.section,@dish.dish_category,@dish]), notice: 'Блюдо успешно обновлено.'

      else
        render action: "edit"
        
      end

  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: "Блюдо удалено." }
      format.json { head :no_content }
    end
  end

  private

  def get_category
    @category = DishCategory.find(params[:dish_category_id])
    @section = Section.find(params[:section_id])
  end
end
