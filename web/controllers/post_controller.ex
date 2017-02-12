defmodule Mtnblog.PostController do
  use Mtnblog.Web, :controller
  alias Mtnblog.Post
  
  def index(conn, _) do
    query = from p in Post, order_by: [desc: p.inserted_at]    
    posts = Repo.all(query)
    render(conn, "index.html", posts: posts)
  end
end
