defmodule Mtnblog.VideoController do
  use Mtnblog.Web, :controller
  alias Mtnblog.Video

  def index(conn, _) do
    videos = Repo.all(Video)
    render(conn, "index.html", videos: videos)
  end

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    videos = Repo.all(Video)
    render(conn, "show.html", video: video, videos: videos)
  end
end
