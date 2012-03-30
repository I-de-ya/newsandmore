# coding: utf-8
class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def new
    @message = Message.new
    @title = "Отзывы"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  def create
    @message = Message.new(params[:message])
    @section = Section.where('title = ?', 'Контакты и обратная связь').first

    respond_to do |format|
      if @message.save
        format.html { redirect_to section_path(@section), notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { redirect_to section_path(@section) }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

end
