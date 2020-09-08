defmodule RecipeBot.Factory do
  use ExMachina.Ecto, repo: RecipeBot.Repo

  def recipes_factory do
    %RecipeBot.Schema.Recipe{
      title: "Tasty Burger",
      prep_minutes: 10,
      cook_minutes: 20,
      total_minutes: 30,
      serving: 6
    }
  end
end
