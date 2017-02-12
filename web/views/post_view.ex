defmodule Mtnblog.PostView do
  use Mtnblog.Web, :view

  def host(url) do
    URI.parse(url).host
  end

  def time_diff(time) do
    Timex.format!(time, "{relative}", :relative)
  end
end
