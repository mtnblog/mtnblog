defmodule Mtnblog.Repo.Migrations.CreateCategoriesTable do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :title, :string

      timestamps()
    end
  end
end
