defmodule Mtnblog.Repo.Migrations.AddCategoryIdToModels do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :category_id, references(:categories)
    end
    
    alter table(:photos) do
      add :category_id, references(:categories)  
    end

    alter table(:podcasts) do
      add :category_id, references(:categories)
    end

    alter table(:posts) do
      add :category_id, references(:categories)
    end

    alter table(:videos) do
      add :category_id, references(:categories)
    end
  end
end
