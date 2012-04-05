#coding: utf-8
class Admin::DishTypesController < Admin::ApplicationController
  # GET /dishes
  # GET /dishes.json
  def index
    if params[:dish_id]
      @dish_types = DishType.where(:dish_id => params[:dish_id]).order("visible DESC, position")
    else
      @dish_types = DishType.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dishes }
    end
  end

  def visible
    @dish = DishType.find(params[:id])
    @dish.toggle(:visible)
    @dish.save
    redirect_to :back, notice: 'Тип блюда обновлен.'
  end 

  def sort
    params[:pos].each_with_index do |id, idx|
      p = DishType.find(id)
      p.position = idx
      p.save
    end
    render :nothing => true
  end 

  def toggleshow
    @dish_type = DishType.find(params[:id])
    @dish_type.toggle(:visible)
    @dish_type.save
    redirect_to :back, notice: 'Тип блюда обновлен.'
  end

  # GET /dishes/new
  # GET /dishes/new.json
  def new
    @dish_type = DishType.new

    respond_to do |format|
      format.html { render "edit" }
      format.json { render json: @dish_type }
    end
  end

  # GET /dishes/1/edit
  def edit
    @dish_type = DishType.find(params[:id])
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish_type = DishType.new(params[:dish_type])
    @dish_type.dish_id = params[:dish_id]

      if @dish_type.save
        redirect_to (params[:commit] == "Сохранить" ? [:admin,@dish_type.dish.dish_category.section,@dish_type.dish.dish_category,@dish_type.dish,:dish_types] : [:edit,:admin,@dish_type.dish.dish_category.section,@dish_type.dish.dish_category,@dish_type.dish,@dish_type]), notice: 'Тип блюда успешно добавлен.'
      else
        render action: "edit"
      end
  end

  # PUT /dishes/1
  # PUT /dishes/1.json
  def update
    #render :inline => "<%= debug params[:dish] %>"
    @dish_type = DishType.find(params[:id])
    @dish_type.dish_id = params[:dish_id]

      if @dish_type.update_attributes(params[:dish_type])
        redirect_to (params[:commit] == "Сохранить" ? [:admin,@dish_type.dish.dish_category.section,@dish_type.dish.dish_category,@dish_type.dish,:dish_types] : [:edit,:admin,@dish_type.dish.dish_category.section,@dish_type.dish.dish_category,@dish_type.dish,@dish_type]), notice: 'Тип блюда успешно обновлен.'
      else
        render action: "edit"
        
      end

  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish_type = DishType.find(params[:id])
    @dish_type.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: "Тип блюда удален." }
      format.json { head :no_content }
    end
  end
end
