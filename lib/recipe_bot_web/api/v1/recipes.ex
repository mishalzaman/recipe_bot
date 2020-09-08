defmodule RecipeBotWeb.API.V1.Recipes do
  use RecipeBotWeb, :controller

  alias RecipeBot.Query.Recipe

  def index(conn, _params) do
    render(conn, "index.json", recipes: Recipe.all)
  end
end
