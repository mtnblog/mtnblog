defmodule Mtnblog.Repo.Migrations.CreatePhotosTable do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :image, :string
      add :location, :string
      add :title, :string

      timestamps()
    end
  end
end
