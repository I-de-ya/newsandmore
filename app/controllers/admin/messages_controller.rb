#coding: utf-8
class Admin::MessagesController < Admin::ApplicationController
  def toggleshow
    @message = Message.find(params[:id])
    @message.toggle(:visible)
    @message.save
    redirect_to :back, notice: 'Сообщение обновлено.'
  end

  def index
    @page_title = "Сообщения"
    @messages = Message.all
  end

  def new
    @message = Message.new
    render "edit"
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:messages] : [:edit,:admin,@message]), notice: 'Сообщение успешно добавлен.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:messages] : [:edit,:admin,@message]), notice: 'Фильм успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def destroy
    @message = message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:messages], notice: "Киношка удалена" }
      format.json { head :no_content }
    end
  end
end