defmodule RecipeBot.Schema.RecipeIngredient do
  use RecipeBot.Schema, :schema
  import Ecto.Changeset

  schema "recipe_ingredients" do
    field(:recipe_id, :binary_id)
    field(:name, :string)
    field(:unit, :string)
    field(:amount, :float)

    timestamps(type: :utc_datetime)
  end

  @spec create_changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def create_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :recipe_id,
      :name,
      :unit,
      :amount
    ])
    |> validate_required([:recipe_id, :name, :unit, :amount])
  end
end
