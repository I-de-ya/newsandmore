#coding: utf-8
class Admin::ImagesController < Admin::ApplicationController
  def toggleshow
    @image = Image.find(params[:id])
    @image.toggle(:visible)
    @image.save
    redirect_to :back, notice: 'Картинка обновлена'
  end

  def index
    @page_title = "Картинки"
    @images = Image.all
  end

  def new
    @image = Image.new
    render "edit"
  end

  def create
    @image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:images] : [:edit,:admin,@image]), notice: 'Картинка успешно добавлена.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
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
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:images], notice: "Новость удалена" }
      format.json { head :no_content }
    end
  end
end