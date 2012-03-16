class RecallsController < ApplicationController
  # GET /recalls
  # GET /recalls.json
  def index
    @recalls = Recall.all
    @recall = Recall.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recalls }
    end
  end

  # GET /recalls/1
  # GET /recalls/1.json
  def show
    @recall = Recall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recall }
    end
  end

  # GET /recalls/new
  # GET /recalls/new.json
  def new
    @recall = Recall.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recall }
    end
  end

  # GET /recalls/1/edit
  def edit
    @recall = Recall.find(params[:id])
  end

  # POST /recalls
  # POST /recalls.json
  def create
    @recall = Recall.new(params[:recall])

    respond_to do |format|
      if @recall.save
        format.html { redirect_to @recall, notice: 'Recall was successfully created.' }
        format.json { render json: @recall, status: :created, location: @recall }
      else
        format.html { render action: "new" }
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
        format.html { redirect_to @recall, notice: 'Recall was successfully updated.' }
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
      format.html { redirect_to recalls_url }
      format.json { head :no_content }
    end
  end
end
