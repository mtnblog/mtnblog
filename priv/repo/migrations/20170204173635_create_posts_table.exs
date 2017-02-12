defmodule Mtnblog.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :rating, :integer, default: 0
      add :url, :string
      add :title, :string

      timestamps()
    end
  end
end
