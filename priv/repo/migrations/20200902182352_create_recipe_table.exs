defmodule RecipeBot.Repo.Migrations.CreateRecipeTable do
  use Ecto.Migration

  def change do
    create table(:recipes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :prep_minutes, :integer
      add :cook_minutes, :integer
      add :total_minutes, :integer
      add :serving, :integer

      timestamps()
    end
  end
end
