defmodule Mtnblog.MountainController do
  use Mtnblog.Web, :controller
  alias Mtnblog.Mountain

  def index(conn, _) do
    mountains = Repo.all(Mountain)
    render(conn, "index.html", mountains: mountains)
  end
end
