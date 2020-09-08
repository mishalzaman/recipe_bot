defmodule RecipeBot.Query.Recipe do
  import Ecto.Query

  alias RecipeBot.Repo
  alias RecipeBot.Schema.Recipe

  def all do
    Recipe
    |> preload(:recipe_ingredients)
    |> Repo.all
  end

  def id(id) do
    from(r in Recipe, where: r.id == ^id)
    |> preload(:recipe_ingredients)
    |> Repo.one
  end
end
