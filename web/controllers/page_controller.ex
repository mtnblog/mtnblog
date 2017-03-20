defmodule Mtnblog.PageController do
  use Mtnblog.Web, :controller

  def home(conn, params) do
    render(conn, "home.html")
  end
end
