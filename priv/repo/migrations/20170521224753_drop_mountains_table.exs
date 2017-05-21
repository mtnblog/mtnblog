defmodule Mtnblog.Repo.Migrations.DropMountainsTable do
  use Ecto.Migration

  def change do
    drop table(:mountains)
  end
end
