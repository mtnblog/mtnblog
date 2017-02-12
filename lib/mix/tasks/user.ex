defmodule Mix.Tasks.User.Create do
  use Mix.Task
  import Mix.Ecto
  alias Mtnblog.{Repo, User}

  def run([email, password]) do
    ensure_started(Repo, [])
    user = User.changeset(%User{email: email, password: password})
    Repo.insert!(user)
  end
end

defmodule Mix.Tasks.User.List do
  use Mix.Task
  import Mix.Ecto
  alias Mtnblog.{Repo, User}

  def run(_) do
    ensure_started(Repo, [])
    for user <- Repo.all(User) do
      IO.inspect(user)
    end
  end
end
