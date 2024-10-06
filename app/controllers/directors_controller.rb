class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    @director =  Director.new
  end

  def create
    @director = Director.new(params.require(:director).permit(:name, :nationality, :birth_date, :genre_id))
    if @director.save
      return redirect_to director_path(@director.id)
    end

    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])

    if @director.update( params.require(:director).permit(:name,:nationality, :birth_date, :genre_id))
      return redirect_to director_path(@director.id)
    end

    render :edit
  end

end