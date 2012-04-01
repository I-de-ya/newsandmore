#coding: utf-8
class Admin::RecallsController < Admin::ApplicationController
  # GET /recalls
  # GET /recalls.json
  def index
    @recalls = Recall.order("created_at ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recalls }
    end
  end

  def toggleshow
    @recall = Recall.find(params[:id])
    @recall.toggle(:show)
    @recall.save
    redirect_to :back, notice: 'Отзыв обновлен.'
  end

  def new
    @recall = Recall.new
    render "edit"
  end

  def edit
    @recall = Recall.find(params[:id])
  end

  # POST /recalls
  # POST /recalls.json
  def create
    @recall = Recall.new(params[:recall])

    respond_to do |format|
      if @recall.save
        format.html { redirect_to edit_admin_recall_path(@recall), notice: 'Отзыв успешно добавлен.' }
        format.json { render json: @recall, status: :created, location: @recall }
      else
        format.html { render action: "edit" }
        format.json { render json: @recall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recalls/1
  # PUT /recalls/1.json
  def update
    @recall = Recall.find(params[:id])

    respond_to do |format|
      if @recall.update_attributes(params[:recall])
        format.html { redirect_to [:edit,:admin,@recall], notice: 'Отзыв успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recalls/1
  # DELETE /recalls/1.json
  def destroy
    @recall = Recall.find(params[:id])
    @recall.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:recalls], notice: 'Отзыв удален.' }
      format.json { head :no_content }
    end
  end
end
