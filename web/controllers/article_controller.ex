defmodule Mtnblog.ArticleController do
  use Mtnblog.Web, :controller
  alias Mtnblog.Article

  def index(conn, _) do
    render(conn, "index.html")
  end

  def show(conn, %{"id" => id}) do
    article = Repo.get!(Article, id)
    render(conn, "show.html", article: article)
  end
end
