defmodule Mtnblog.PhotoController do
  use Mtnblog.Web, :controller
  alias Mtnblog.Photo

  def index(conn, _) do
    photos = Repo.all(Photo)
    render(conn, "index.html", photos: photos)
  end

  def show(conn, %{"id" => id}) do
    photo = Repo.get!(Photo, id)
    photos = Repo.all(Photo)
    render(conn, "show.html", photo: photo, photos: photos)
  end
end
