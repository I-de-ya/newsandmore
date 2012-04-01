#coding: utf-8
class Admin::TextsController < Admin::ApplicationController
  # GET /texts
  # GET /texts.json
  def index
    @texts = Text.order("created_at ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @texts }
    end
  end

  def toggleshow
    @text = Text.find(params[:id])
    @text.toggle(:show)
    @text.save
    redirect_to :back, notice: 'Отзыв обновлен.'
  end

  def new
    @text = Text.new
    render "edit"
  end

  def edit
    @text = Text.find(params[:id])
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = Text.new(params[:text])

    respond_to do |format|
      if @text.save
        format.html { redirect_to edit_admin_text_path(@text), notice: 'Отзыв успешно добавлен.' }
        format.json { render json: @text, status: :created, location: @text }
      else
        format.html { render action: "edit" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /texts/1
  # PUT /texts/1.json
  def update
    @text = Text.find(params[:id])

    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to [:edit,:admin,@text], notice: 'Отзыв успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @text = Text.find(params[:id])
    @text.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:texts], notice: 'Отзыв удален.' }
      format.json { head :no_content }
    end
  end
end
