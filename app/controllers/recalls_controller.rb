# coding: utf-8
class RecallsController < ApplicationController

  def index
    @title = "Отзывы"
    @recalls = Recall.all
    #@positive = Recall.positive.length
    #@negative = Recall.negative.length
    @recall = Recall.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recalls }
    end
  end

  def create
    @recall = Recall.new(params[:recall])
    @section = Section.where('title = ?', 'Отзывы').first
    @sections = Section.visible
    @recalls = Recall.all
    respond_to do |format|

      if @recall.save
        format.html { redirect_to section_path(@section), notice: 'Recall was successfully created.' }
        format.json { render json: @recall, status: :created, location: @recall }
      else
        format.html { render 'sections/show' }
        format.json { render json: @recall.errors, status: :unprocessable_entity }
      end
    end
  end

end
