defmodule RecipeBot.Factory do
  use ExMachina.Ecto, repo: RecipeBot.Repo

  @spec recipe_factory :: RecipeBot.Schema.Recipe.t()
  def recipe_factory do
    %RecipeBot.Schema.Recipe{
      title: "Tasty Burger",
      prep_minutes: 10,
      cook_minutes: 20,
      total_minutes: 30,
      serving: 6
    }
  end

  @spec recipe_ingredient_factory :: RecipeBot.Schema.RecipeIngredient.t()
  def recipe_ingredient_factory do
    %RecipeBot.Schema.RecipeIngredient{
      name: "Salt",
      unit: "teaspoon",
      amount: 0.5
    }
  end

  @spec recipe_nutrition_factory :: RecipeBot.Schema.RecipeIngredient.t()
  def recipe_nutrition_factory do
    %RecipeBot.Schema.RecipeNutrition{
      name: "Calcium",
      unit: "mg",
      amount: 0.2
    }
  end
end
