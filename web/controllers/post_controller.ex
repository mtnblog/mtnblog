defmodule Mtnblog.PostController do
  use Mtnblog.Web, :controller
  alias Mtnblog.{Category, Post}
  
  def index(conn, params) do
    page_num = params["page"]
    categories = Category |> order_by(asc: :title) |> Repo.all()
    category = if is_nil(params["category"]), do: nil, else: Repo.get_by(Category, title: params["category"])
    
    case category do
      nil ->
        current_category = "All Content"
        page =
          Post 
          |> order_by(desc: :inserted_at)
          |> Repo.paginate(page: page_num, page_size: 20)
      
      _ ->
          current_category = category.title 
          page = 
            Post
            |> where([p], p.category_id == ^category.id)
            |> order_by(desc: :inserted_at)
            |> Repo.paginate(page: page_num, page_size: 20)
    end

    conn
    |> assign(:posts, page.entries)
    |> assign(:page, page)
    |> assign(:categories, categories)
    |> assign(:current_category, current_category)
    |> render("index.html")
  end
end
