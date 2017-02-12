defmodule Mtnblog.ArticleController do
  use Mtnblog.Web, :controller

  def index(conn, _) do
    render(conn, "index.html")
  end

  def show(conn, _) do
    render(conn, "show.html")
  end
end
