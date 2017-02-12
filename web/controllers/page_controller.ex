defmodule Mtnblog.PageController do
  use Mtnblog.Web, :controller
  alias Mtnblog.{Post, Photo, Podcast}

  def home(conn, _) do
    posts = Repo.all(Post)

    top_posts = posts 
      |> Enum.sort(fn(x, y) -> x.rating > y.rating end)

    recent_posts = posts
      |> Enum.sort(fn(x, y) -> x.inserted_at > y.inserted_at end)

    render(conn, "home.html", top_posts: top_posts, recent_posts: recent_posts)
  end
end
