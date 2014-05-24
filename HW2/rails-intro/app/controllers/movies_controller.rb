class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    @all_ratings = Movie.select(:rating).map(&:rating).uniq

    session[:sort] = params[:sort] if params[:sort].present?
    session[:selected_ratings] = Hash[@all_ratings.map {|r|[r,r]}] if !params[:ratings].present? and !session[:selected_ratings].present?
    session[:selected_ratings] = params[:ratings] if params[:ratings].present?

    @movies = Movie.order(session[:sort])
    @movies = @movies.where(:rating => session[:selected_ratings].keys)

flash[:notice] = "session_selrat: #{session[:selected_ratings]}"
#flash[:notice] = "session_sort: #{session[:sort]}"
#flash[:notice] = "param_sort: #{params[:sort]}"
#flash[:notice] = "param_selrat: #{params[:ratings]}"

    if !params[:sort].present? and !params[:ratings].present? and !session[:sort].present? and session[:selected_ratings].present?
      redirect_to movies_path(:ratings => session[:selected_ratings])
    elsif !params[:sort].present? and !params[:ratings].present? and session[:sort].present? and session[:selected_ratings].present?
      redirect_to movies_path(:sort => session[:sort], :ratings => session[:selected_ratings])
    elsif params[:sort].present? and !params[:ratings].present? and session[:selected_ratings].present?
      redirect_to movies_path(:sort => params[:sort], :ratings => session[:selected_ratings])
    elsif !params[:sort].present? and params[:ratings].present? and session[:sort].present?
      redirect_to movies_path(:ratings => params[:ratings], :sort => session[:sort])
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
