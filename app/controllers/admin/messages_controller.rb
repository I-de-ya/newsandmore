#coding: utf-8
class Admin::MessagesController < Admin::ApplicationController

  def index
    @page_title = "Обратная связь"
    @messages = Message.all
  end

  def show
    @page_title = "Редактирование сообщения"
    @message = Message.find(params[:id])
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