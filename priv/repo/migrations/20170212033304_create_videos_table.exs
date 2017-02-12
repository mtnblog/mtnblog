defmodule Mtnblog.Repo.Migrations.CreateVideosTable do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :image, :string
      add :location, :string
      add :title, :string
      add :url, :string

      timestamps()
    end
  end
end
