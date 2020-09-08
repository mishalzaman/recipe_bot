defmodule RecipeBotWeb.API.V1.RecipesView do
  use RecipeBotWeb, :view

  def render("index.json", %{recipes: recipes}) do
    %{
      result: render_many(recipes, RecipeBotWeb.API.V1.RecipesView , "recipe.json"),
      status: 200
    }
  end

  def render("recipe.json", data) do
    recipe = data.recipes
    %{
      id: recipe.id,
      title: recipe.title,
      prep_minutes: recipe.prep_minutes,
      cook_minutes: recipe.cook_minutes,
      total_minutes: recipe.total_minutes,
      serving: recipe.serving
    }
  end
end
