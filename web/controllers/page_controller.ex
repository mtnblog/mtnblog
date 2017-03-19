defmodule Mtnblog.PageController do
  use Mtnblog.Web, :controller
  alias Mtnblog.{Category, Post, Photo, Video}

  def landing(conn, _) do
    render(conn, "landing.html", layout: false)  
  end

  def home(conn, params) do
    page_num = params["page"]

    {diff, _} =
      case params["diff"] do
        nil -> {31, :days}
        _   -> Integer.parse(params["diff"])
      end

    current_filter = 
      case diff do
        7   -> "This Week"
        31  -> "This Month"
        365 -> "This Year"
      end

    page = 
      Post
      |> order_by(desc: :rating)
      |> where([p], p.inserted_at > datetime_add(^Ecto.DateTime.utc, ^-diff, "day"))
      |> Repo.paginate(page: page_num, page_size: 10)

    conn
    |> assign(:posts, page.entries)
    |> assign(:page, page)
    |> assign(:current_filter, current_filter)
    |> assign(:diff, diff)
    |> render("home.html")
  end

  # This function is just to store code for the categories version of the home page
  def categories(conn, params) do
    page_num = params["page"]
    categories = Category |> order_by(asc: :title) |> Repo.all()
    category = if is_nil(params["category"]), do: nil, else: Repo.get_by(Category, title: params["category"])
    
    case category do
      nil ->
        current_category = "All Content"
        page =
          Post 
          |> order_by(desc: :inserted_at)
          |> Repo.paginate(page: page_num, page_size: 10)
      
      _ ->
          current_category = category.title 
          page = 
            Post
            |> where([p], p.category_id == ^category.id)
            |> order_by(desc: :inserted_at)
            |> Repo.paginate(page: page_num, page_size: 10)
    end

    conn
    |> assign(:posts, page.entries)
    |> assign(:page, page)
    |> assign(:categories, categories)
    |> assign(:current_category, current_category)
    |> render("home.html")
  end
end
