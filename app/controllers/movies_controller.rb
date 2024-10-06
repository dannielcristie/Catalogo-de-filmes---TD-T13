class MoviesController < ApplicationController
  def index 
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new 
    @movie = Movie.new
  end

  def create 
    @movie = Movie.create(params.require(:movie).permit(:title, :release_year, :synopsis, :country_of_origin, :duration, :director_id, :genre_id))

    if @movie.save
      return redirect_to movie_path(@movie.id)
    end

    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    
    if Movie.update(params.require(:movie).permit(:title, :release_year, :synopsis, :country_of_origin, :duration, :director_id, :genre_id))
      return redirect_to movie_path(@movie.id)
    end
    render :edit
  end

end