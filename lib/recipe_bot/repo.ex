defmodule RecipeBot.Repo do
  use Ecto.Repo,
    otp_app: :recipe_bot,
    adapter: Ecto.Adapters.Postgres
end
