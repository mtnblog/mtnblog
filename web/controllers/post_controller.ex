defmodule Mtnblog.PostController do
  use Mtnblog.Web, :controller
  alias Mtnblog.Post
  
  def index(conn, params) do
    page =
      Post 
      |> order_by(desc: :inserted_at)
      |> Repo.paginate(page_size: 20)
      
    conn
    |> assign(:page, page)
    |> render("index.html")
  end
end
