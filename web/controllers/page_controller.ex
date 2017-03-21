defmodule Mtnblog.PageController do
  use Mtnblog.Web, :controller

  def home(conn, _) do
    render(conn, "home.html")
  end
end
