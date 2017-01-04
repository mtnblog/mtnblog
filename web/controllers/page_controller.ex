defmodule Mtnblog.PageController do
  use Mtnblog.Web, :controller

  def index(conn, _params) do
    posts = Repo.all(Post)
    render(conn, "index.html", posts: posts)
  end
end
