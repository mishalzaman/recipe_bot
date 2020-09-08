defmodule RecipeBot.Schema.Recipe do
  use RecipeBot.Schema, :schema
  import Ecto.Changeset

  schema "recipes" do
    field(:title, :string)
    field(:prep, :string)
    field(:cook, :string)
    field(:total, :string)
    field(:serving, :string)
    field(:ingredients, {:array, :string})
    field(:directions, {:array, :string})
    field(:nutrition_information, {:array, :string})
    field(:module, :string)

    timestamps(type: :utc_datetime)
  end

  @spec create_changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def create_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :title,
      :prep,
      :cook,
      :total,
      :serving,
      :ingredients,
      :directions,
      :nutrition_information,
      :module
    ])
    |> validate_required([:title, :ingredients, :directions, :module])
  end
end
