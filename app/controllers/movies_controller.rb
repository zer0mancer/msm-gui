class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def destroy

    movie_id = params.fetch("path_id")
    matching_movie = Movie.where({:id => movie_id })
    the_movie = matching_movie.at(0)
    the_movie.destroy
    
    redirect_to("/movies")
  end

  def create
    movie = Movie.new
    movie.title = params.fetch("the_title")
    movie.year = params.fetch("the_year")
    movie.duration = params.fetch("the_duration")
    movie.description = params.fetch("the_description")
    movie.image = params.fetch("the_image")

    movie.director_id = params.fetch("the_director_id")

    movie.save

    redirect_to("/movies")



  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end


end
