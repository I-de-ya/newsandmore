#coding: utf-8
class Admin::MoviesController < Admin::ApplicationController
  def toggleshow
    @movie = Movie.find(params[:id])
    @movie.toggle(:visible)
    @movie.save
    redirect_to :back, notice: 'Кино обновлено.'
  end

  def index
    @page_title = "Фильмы"
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    render "edit"
  end

  def edit
    @page_title = "Редактирование фильма"    
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:movies] : [:edit,:admin,@movie]), notice: 'Фильм успешно добавлен.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to (params[:commit] == "Сохранить" ? [:admin,:movies] : [:edit,:admin,@movie]), notice: 'Фильм успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,:movies], notice: "Киношка удалена" }
      format.json { head :no_content }
    end
  end
end