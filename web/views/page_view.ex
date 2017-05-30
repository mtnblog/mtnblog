defmodule Mtnblog.PageView do
  use Mtnblog.Web, :view

  def truncate(content, length) do
    content |> String.slice(0..length)
  end
end
