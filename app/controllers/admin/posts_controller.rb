#coding: utf-8
class Admin::PostsController < Admin::ApplicationController
  def toggleshow
    @post = Post.find(params[:id])
    @post.toggle(:show)
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
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    
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