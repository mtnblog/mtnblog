defmodule Mtnblog.PostView do
  use Mtnblog.Web, :view

  def host(url) do
    List.last(String.split(URI.parse(url).host, "www."))
  end

  def time_diff(time) do
    Timex.format!(time, "{relative}", :relative)
  end
end
