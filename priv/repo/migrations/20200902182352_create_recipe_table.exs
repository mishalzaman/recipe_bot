defmodule RecipeBot.Repo.Migrations.CreateRecipeTable do
  use Ecto.Migration

  def change do
    create table(:recipes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :prep_minutes, :integer
      add :cook_minutes, :integer
      add :total_minutes, :integer
      add :serving, :float
      add :ingredients, {:array, :string}
      add :directions, {:array, :string}
      add :nutrition_information, {:array, :string}
      add :module, :string

      timestamps()
    end
  end
end
