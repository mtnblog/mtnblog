defmodule Mtnblog.Repo.Migrations.CreatePodcastsTable do
  use Ecto.Migration

  def change do
    create table(:podcasts) do
      add :url, :string
      add :title, :string

      timestamps()
    end
  end
end
