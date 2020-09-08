# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RecipeBot.Repo.insert!(%RecipeBot.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


RecipeBot.Repo.insert!(%RecipeBot.Schema.Recipe{
  title: "Tasty Burger",
  prep_minutes: 10,
  cook_minutes: 20,
  total_minutes: 30,
  serving: 6
})
