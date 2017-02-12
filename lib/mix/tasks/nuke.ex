defmodule Mix.Tasks.Nuke.Photos do
  use Mix.Task
  import Mix.Ecto
  alias Mtnblog.{Repo, Photo}
  
  def run(_) do
    ensure_started(Repo, [])
    Repo.delete_all(Photo)
  end
end

defmodule Mix.Tasks.Nuke.Posts do
  use Mix.Task
  import Mix.Ecto
  alias Mtnblog.{Repo, Post}

  def run(_) do
    ensure_started(Repo, [])
    Repo.delete_all(Post)
  end
end

defmodule Mix.Tasks.Nuke.Users do
  use Mix.Task
  import Mix.Ecto
  alias Mtnblog.{Repo, User}
  
  def run(_) do
    ensure_started(Repo, [])
    Repo.delete_all(User)
  end
end
