#coding: utf-8
class Admin::PagesController < Admin::ApplicationController
  def toggleshow
    @page = Page.find(params[:id])
    @page.toggle(:show)
    @page.save
    redirect_to :back, notice: 'Текст обновлен.'
  end

  def index
    @page_title = "Тексты"
    @pages = Page.all
  end

  def new
    @page = Page.new
    render "edit"
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to [:edit,:admin,@page], notice: 'Текст успешно добавлен.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to [:edit,:admin,@page], notice: 'Текст успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:pages], notice: "Текст удален" }
      format.json { head :no_content }
    end
  end
end