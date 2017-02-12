defmodule Mtnblog.Repo.Migrations.CreateArticlesTable do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :author, :string
      add :category, :string
      add :content, :text
      add :feature_image, :string
      add :published, :boolean
      add :slug, :string
      add :title, :string      

      timestamps()
    end
  end
end
