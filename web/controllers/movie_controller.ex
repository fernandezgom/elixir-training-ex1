defmodule Ex1.MovieController do
  use Ex1.Web, :controller
  #JLF Use movies.ex
  alias Ex1.Movies

  def index(conn, _params) do
    movieList = Movies.all
    render conn, "index.html", mL: movieList
  end
  # JLF Including *new* definition for 3rd test
  def new(conn, _params) do
    render conn, "new.html"
  end

  # JLF Including *create* definition for 4th test
  def create(conn, %{"movie" => movie}) do
    Movies.insert(movie)
    redirect conn, to: movie_path(conn, :index)
  end

  # JLF Including *show* definition for 5th test and populating mv to be used in the view
  def show(conn, %{"id" => id}) do
    movie = Movies.get!(id)
    render conn, "show.html", mv: movie
  end
end
