defmodule Mtnblog.Repo.Migrations.CreateMountainsTable do
  use Ecto.Migration

  def change do
    create table(:mountains) do
      add :elevation, :float
      add :latitude, :float
      add :longitude, :float
      add :name, :string

      timestamps()
    end
  end
end
