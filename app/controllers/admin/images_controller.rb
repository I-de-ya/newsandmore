#coding: utf-8
class Admin::ImagesController < Admin::ApplicationController
  before_filter :get_section
  
  def sort
    params[:photo].each_with_index do |id, idx|
      p = @section.images.find(id)
      p.position = idx
      p.save
    end
    render :nothing => true
  end
  
  def toggleshow
    @image = @section.image.find(params[:id])
    @image.toggle(:visible)
    @image.save
    redirect_to :back, notice: 'Картинка обновлена'
  end

  def index
    @page_title = "Картинки"
    @images = Image.all
  end

  def new
    @image = @section.images.build
    render "edit"
  end

  def create
    @parent = @section
    @photo = @parent.images.build(params[:photo])
    if @photo.save
      render 'admin/photos/create'
    end
  end

  def edit
    @page_title = "Редактирование картинки"
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:images] : [:edit,:admin,@image]), notice: 'Картинка успешно обновлена.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end    
  end

  def show
    
  end

  def destroy
    @photo = Image.find(params[:id])
    @photo.destroy
    render 'admin/photos/destroy'
  end

  private
  def get_section
    @section = Section.find(params[:section_id])
  end
end