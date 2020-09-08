defmodule RecipeBot.Schema.Recipe do
  use RecipeBot.Schema, :schema
  import Ecto.Changeset

  schema "recipes" do
    field(:title, :string)
    field(:prep_minutes, :integer)
    field(:cook_minutes, :integer)
    field(:total_minutes, :integer)
    field(:serving, :integer)

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
      :prep_minutes,
      :cook_minutes,
      :total_minutes,
      :serving,
      :module
    ])
    |> validate_required([:title])
  end
end
