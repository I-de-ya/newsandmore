class MenuTypesController < ApplicationController
  # GET /menu_types
  # GET /menu_types.json
  def index
    @menu_types = MenuType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menu_types }
    end
  end

  # GET /menu_types/1
  # GET /menu_types/1.json
  def show
    @menu_type = MenuType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu_type }
    end
  end

  # GET /menu_types/new
  # GET /menu_types/new.json
  def new
    @menu_type = MenuType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu_type }
    end
  end

  # GET /menu_types/1/edit
  def edit
    @menu_type = MenuType.find(params[:id])
  end

  # POST /menu_types
  # POST /menu_types.json
  def create
    @menu_type = MenuType.new(params[:menu_type])

    respond_to do |format|
      if @menu_type.save
        format.html { redirect_to @menu_type, notice: 'Menu type was successfully created.' }
        format.json { render json: @menu_type, status: :created, location: @menu_type }
      else
        format.html { render action: "new" }
        format.json { render json: @menu_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menu_types/1
  # PUT /menu_types/1.json
  def update
    @menu_type = MenuType.find(params[:id])

    respond_to do |format|
      if @menu_type.update_attributes(params[:menu_type])
        format.html { redirect_to @menu_type, notice: 'Menu type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_types/1
  # DELETE /menu_types/1.json
  def destroy
    @menu_type = MenuType.find(params[:id])
    @menu_type.destroy

    respond_to do |format|
      format.html { redirect_to menu_types_url }
      format.json { head :no_content }
    end
  end
end
