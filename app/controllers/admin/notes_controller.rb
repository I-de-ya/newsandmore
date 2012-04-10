#coding: utf-8
class Admin::NotesController < Admin::ApplicationController

  def toggleshow
    @note = Note.find(params[:id])
    @note.toggle(:visible)
    @note.save
    redirect_to :back, notice: 'Текст обновлен.'
  end

  def index
    @page_title = "Тексты"
    @notes = Note.all
  end

  def new
    @note = Note.new
    render "edit"
  end

  def edit
    @page_title = "Редактирование текста"
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:notes] : [:edit,:admin,@note]), notice: 'Текст успешно добавлен.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:notes] : [:edit,:admin,@note]), notice: 'Текст успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:notes], notice: "Текст удален" }
      format.json { head :no_content }
    end
  end

end