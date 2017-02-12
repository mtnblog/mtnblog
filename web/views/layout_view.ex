defmodule Mtnblog.LayoutView do
  use Mtnblog.Web, :view

  def active_class(conn, path) do
    currentPath = Path.join(["/" | conn.path_info])
    case String.contains?(currentPath, path) do
      true -> "class=active"
      _    -> nil
    end
  end
end
