defmodule RecipeBotWeb.Schema.RecipeIngredientTest do
  use RecipeBot.DataCase

  import RecipeBot.Factory

  alias RecipeBot.Schema.RecipeIngredient

  test "create recipe_ingredient" do
    recipe = insert(:recipe)
    params = params_for(:recipe_ingredient, name: "Test Name", unit: "mg", amount: 0.5, recipe_id: recipe.id)
    changeset = RecipeIngredient.create_changeset(%RecipeIngredient{}, params)

    assert changeset.valid?
  end

  test "changeset requires recipe_id" do
    params = params_for(:recipe_ingredient, recipe_id: nil)
    changeset = RecipeIngredient.create_changeset(%RecipeIngredient{}, params)

    refute changeset.valid?
    assert Keyword.get(changeset.errors, :recipe_id) == {"can't be blank", [validation: :required]}
  end

  test "changeset requires name" do
    params = params_for(:recipe_ingredient, name: nil)
    changeset = RecipeIngredient.create_changeset(%RecipeIngredient{}, params)

    refute changeset.valid?
    assert Keyword.get(changeset.errors, :name) == {"can't be blank", [validation: :required]}
  end

  test "changeset requires unit" do
    params = params_for(:recipe_ingredient, unit: nil)
    changeset = RecipeIngredient.create_changeset(%RecipeIngredient{}, params)

    refute changeset.valid?
    assert Keyword.get(changeset.errors, :unit) == {"can't be blank", [validation: :required]}
  end

  test "changeset requires amount" do
    params = params_for(:recipe_ingredient, amount: nil)
    changeset = RecipeIngredient.create_changeset(%RecipeIngredient{}, params)

    refute changeset.valid?
    assert Keyword.get(changeset.errors, :amount) == {"can't be blank", [validation: :required]}
  end
end
