defmodule RecipeBot.Query.Recipe do
  import Ecto.Query

  alias RecipeBot.Repo
  alias RecipeBot.Schema.Recipe

  def all do
    Repo.all(Recipe)
  end

  def id(id) do
    query = from(r in Recipe, where: r.id == ^id)
    Repo.one(query)
  end
end
