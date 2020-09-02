defmodule RecipeBot.Repo.Migrations.CreateRecipeTable do
  use Ecto.Migration

  def change do
    create table(:recipes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :prep, :string
      add :cook, :string
      add :serving, :string
      add :ingredients, {:array, :string}
      add :directions, {:array, :string}
      add :nutrition_information, {:array, :string}
      add :module, :string

      timestamps()
    end
  end
end
