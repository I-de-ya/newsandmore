#coding: utf-8
class Admin::PostsController < Admin::ApplicationController
  def toggleshow
    @post = Post.find(params[:id])
    @post.toggle(:visible)
    @post.save
    redirect_to :back, notice: 'Новость обновлена'
  end

  def index
    @page_title = "Новости"
    @posts = Post.all
  end

  def new
    @post = Post.new
    render "edit"
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:posts] : [:edit,:admin,@post]), notice: 'Новость успешно добавлена.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:posts] : [:edit,:admin,@post]), notice: 'Новость успешно обновлена.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end    
  end

  def show
    
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:posts], notice: "Новость удалена" }
      format.json { head :no_content }
    end
  end
end