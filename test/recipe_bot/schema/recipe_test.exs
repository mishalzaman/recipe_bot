defmodule RecipeBotWeb.Schema.RecipeTest do
  use RecipeBot.DataCase

  import RecipeBot.Factory

  alias RecipeBot.Schema.Recipe

  test "create recipe" do
    params = params_for(:recipe, title: "Test Title")
    changeset = Recipe.create_changeset(%Recipe{}, params)

    assert changeset.valid?
  end

  test "changeset requires title" do
    params = params_for(:recipe, title: nil)
    changeset = Recipe.create_changeset(%Recipe{}, params)

    refute changeset.valid?
    assert Keyword.get(changeset.errors, :title) == {"can't be blank", [validation: :required]}
  end
end
