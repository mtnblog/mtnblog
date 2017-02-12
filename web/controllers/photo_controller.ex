defmodule Mtnblog.PhotoController do
  use Mtnblog.Web, :controller
  alias Mtnblog.Photo

  def index(conn, _) do
    query = from p in Photo, order_by: [desc: p.inserted_at]    
    photos = Repo.all(query)
    render(conn, "index.html", photos: photos)
  end

  def show(conn, %{"id" => id}) do
    query = from p in Photo, order_by: [desc: p.inserted_at]        
    photo = Repo.get!(Photo, id)
    photos = Repo.all(query)
    render(conn, "show.html", photo: photo, photos: photos)
  end
end
