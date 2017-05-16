defmodule Mtnblog.PageController do
  use Mtnblog.Web, :controller
  alias Mtnblog.{Photo, Video, Repo}

  def home(conn, _) do
    photos = Repo.all(Photo)
    videos = Repo.all(Video)

    items = Enum.concat(photos, videos) |> Enum.sort(&(&1.inserted_at > &2.inserted_at))
    render(conn, "home.html", items: items)
  end
end
