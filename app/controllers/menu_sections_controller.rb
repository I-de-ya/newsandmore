class MenuSectionsController < ApplicationController
  # GET /menu_sections
  # GET /menu_sections.json
  def index
    @menu_sections = MenuSection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menu_sections }
    end
  end

  # GET /menu_sections/1
  # GET /menu_sections/1.json
  def show
    @menu_section = MenuSection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu_section }
    end
  end

  # GET /menu_sections/new
  # GET /menu_sections/new.json
  def new
    @menu_section = MenuSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu_section }
    end
  end

  # GET /menu_sections/1/edit
  def edit
    @menu_section = MenuSection.find(params[:id])
  end

  # POST /menu_sections
  # POST /menu_sections.json
  def create
    @menu_section = MenuSection.new(params[:menu_section])

    respond_to do |format|
      if @menu_section.save
        format.html { redirect_to @menu_section, notice: 'Menu section was successfully created.' }
        format.json { render json: @menu_section, status: :created, location: @menu_section }
      else
        format.html { render action: "new" }
        format.json { render json: @menu_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menu_sections/1
  # PUT /menu_sections/1.json
  def update
    @menu_section = MenuSection.find(params[:id])

    respond_to do |format|
      if @menu_section.update_attributes(params[:menu_section])
        format.html { redirect_to @menu_section, notice: 'Menu section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_sections/1
  # DELETE /menu_sections/1.json
  def destroy
    @menu_section = MenuSection.find(params[:id])
    @menu_section.destroy

    respond_to do |format|
      format.html { redirect_to menu_sections_url }
      format.json { head :no_content }
    end
  end
end
