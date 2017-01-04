defmodule Mtnblog.SubscriptionController do
  use Mtnblog.Web, :controller

  alias Mtnblog.Post

  def challenge(conn, %{"hub.challenge" => challenge}) do
    text(conn, challenge)
  end

  def callback(conn, _params) do
    token = Application.get_env(:mtnblog, :instagram)[:access_token]
    response = Tesla.get("https://api.instagram.com/v1/users/self/media/recent/", query: [access_token: token])
    data = Poison.decode!(response.body)

    for post <- data["data"] do
      url = post["link"]
      image = post["images"]["standard_resolution"]["url"]
      unless Mtnblog.Repo.get_by(Post, url: url) do
        Mtnblog.Repo.insert(%Post{url: url, image: image})
      end
    end
  end
end
