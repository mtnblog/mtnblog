defmodule Mtnblog.VideoController do
  use Mtnblog.Web, :controller
  alias Mtnblog.Video

  def index(conn, _) do
    query = from v in Video, order_by: [desc: v.inserted_at]
    [video | videos] = Repo.all(query)
    render(conn, "show.html", video: video, videos: videos)
  end

  def show(conn, %{"id" => id}) do
    query = from v in Video, order_by: [desc: v.inserted_at]    
    video = Repo.get!(Video, id)
    videos = Repo.all(query)
    render(conn, "show.html", video: video, videos: videos)
  end
end
