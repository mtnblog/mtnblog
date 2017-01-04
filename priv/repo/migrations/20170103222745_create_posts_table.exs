defmodule Mtnblog.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :image, :string
      add :url, :string

      timestamps()
    end
  end
end
