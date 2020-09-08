defmodule RecipeBot.Repo.Migrations.CreateRecipeIngredients do
  use Ecto.Migration

  def change do
    create table(:recipe_ingredients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :recipe_id, :binary_id
      add :name, :string
      add :unit, :string
      add :amount, :float

      timestamps()
    end
  end
end
