defmodule Mtnblog.Repo.Migrations.DropPostsTable do
  use Ecto.Migration

  def change do
    drop table(:posts)
  end
end
