defmodule Mix.Tasks.Seed.Photos do
  use Mix.Task
  import Mix.Ecto
  alias Mtnblog.{Repo, Photo}

  def run(_) do
    ensure_started(Repo, [])
    url = "https://api.instagram.com/v1/users/self/media/recent/"
    token = "3812370172.3b0bc9d.2044f0a1f6994c49b662a73e50af7770"
    response = Tesla.get(url, query: [access_token: token])
    json = Poison.decode!(response.body)

    for photo <- json["data"] do
      src = photo["images"]["standard_resolution"]["url"]
      Repo.insert!(%Photo{image: src})
    end
  end
end
