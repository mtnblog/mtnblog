defmodule Mtnblog.Repo.Migrations.DropPodcastsTable do
  use Ecto.Migration

  def change do
    drop table(:podcasts)
  end
end
