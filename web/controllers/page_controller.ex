defmodule Mtnblog.PageController do
  use Mtnblog.Web, :controller
  alias Mtnblog.{Article, Photo, Video}

  def home(conn, _) do
    #articles = Repo.all(Article)
    photos = Repo.all(Photo)
    videos = Repo.all(Video)
    article = Repo.get!(Article, 1)

    items = Enum.concat(photos, videos) |> Enum.sort(&(NaiveDateTime.compare(&1.inserted_at, &2.inserted_at) == :gt))
    
    render(conn, "home.html", items: items, article: article)
  end
end
