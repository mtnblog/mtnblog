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
    photos = Repo.all(query)
    photo = Repo.get!(Photo, id)

    has_prev? = photo.id != 1
    has_next? = photo.id != length(photos)

    prev_url = "/photos/" <> to_string(photo.id - 1)
    next_url = "/photos/" <> to_string(photo.id + 1)

    conn
    |> assign(:photo, photo)
    |> assign(:photos, photos)
    |> assign(:has_prev?, has_prev?)
    |> assign(:has_next?, has_next?)
    |> assign(:prev_url, prev_url)
    |> assign(:next_url, next_url)
    |> render("show.html")
  end
end
