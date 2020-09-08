defmodule RecipeBotWeb.Schema.RecipeNutritionTest do
  use RecipeBot.DataCase

  import RecipeBot.Factory

  alias RecipeBot.Schema.RecipeNutrition

  test "create recipe_ingredient" do
    recipe = insert(:recipe)
    params = params_for(:recipe_nutrition, name: "Test Name", unit: "mg", amount: 0.5, recipe_id: recipe.id)
    changeset = RecipeNutrition.create_changeset(%RecipeNutrition{}, params)

    assert changeset.valid?
  end

  test "changeset requires recipe_id" do
    params = params_for(:recipe_nutrition, recipe_id: nil)
    changeset = RecipeNutrition.create_changeset(%RecipeNutrition{}, params)

    refute changeset.valid?
    assert Keyword.get(changeset.errors, :recipe_id) == {"can't be blank", [validation: :required]}
  end

  test "changeset requires name" do
    params = params_for(:recipe_nutrition, name: nil)
    changeset = RecipeNutrition.create_changeset(%RecipeNutrition{}, params)

    refute changeset.valid?
    assert Keyword.get(changeset.errors, :name) == {"can't be blank", [validation: :required]}
  end

  test "changeset requires unit" do
    params = params_for(:recipe_nutrition, unit: nil)
    changeset = RecipeNutrition.create_changeset(%RecipeNutrition{}, params)

    refute changeset.valid?
    assert Keyword.get(changeset.errors, :unit) == {"can't be blank", [validation: :required]}
  end

  test "changeset requires amount" do
    params = params_for(:recipe_nutrition, amount: nil)
    changeset = RecipeNutrition.create_changeset(%RecipeNutrition{}, params)

    refute changeset.valid?
    assert Keyword.get(changeset.errors, :amount) == {"can't be blank", [validation: :required]}
  end
end
