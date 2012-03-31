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
  end
end