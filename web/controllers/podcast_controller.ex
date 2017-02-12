defmodule Mtnblog.PodcastController do
  use Mtnblog.Web, :controller

  def index(conn, _) do
    render(conn, "index.html")
  end
end
