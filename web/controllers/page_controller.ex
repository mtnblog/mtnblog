defmodule Mtnblog.PageController do
  use Mtnblog.Web, :controller

  def index(conn, _params) do
  	{:ok, data} = File.read("web/static/assets/instadata.json")
  	posts = Poison.decode!(data)
    render(conn, "index.html", posts: posts)
  end
end
