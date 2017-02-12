defmodule Mtnblog.PostController do
  use Mtnblog.Web, :controller
  alias Mtnblog.Post
  
  def index(conn, _) do
    posts = Repo.all(Post)
    render(conn, "index.html", posts: posts)
  end
end
