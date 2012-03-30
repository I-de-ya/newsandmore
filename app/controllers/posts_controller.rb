# coding: utf-8
class PostsController < ApplicationController
  def show
    @archive = Event.all
    @post = Post.find(params[:id])
    @sections = Section.all
    @title = "#{@post.title} "

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
end
