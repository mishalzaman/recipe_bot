defmodule RecipeBotWeb.Api.V1.RecipesTest do
  use RecipeBotWeb.ConnCase
  import RecipeBot.Factory

  test "GET /api/v1/recipes with results", %{conn: conn} do
    recipe1 = insert(:recipes)
    recipe2 = insert(:recipes)

    expected_result = [
      %{
        "cook_minutes" => recipe1.cook_minutes,
        "id" => recipe1.id,
        "prep_minutes" => recipe1.prep_minutes,
        "serving" => recipe1.serving,
        "title" => recipe1.title,
        "total_minutes" => recipe1.total_minutes,
      },
      %{
        "cook_minutes" => recipe2.cook_minutes,
        "id" => recipe2.id,
        "prep_minutes" => recipe2.prep_minutes,
        "serving" => recipe2.serving,
        "title" => recipe2.title,
        "total_minutes" => recipe2.total_minutes,
      },
    ]

    conn = get(conn, "/api/v1/recipes")
    {:ok, resp_body} = Poison.decode(conn.resp_body)

    assert resp_body["result"] == expected_result
    assert resp_body["status"] == 200
  end

  test "GET /api/v1/recipes with no results", %{conn: conn} do
    conn = get(conn, "/api/v1/recipes")
    {:ok, resp_body} = Poison.decode(conn.resp_body)

    assert resp_body["result"] == []
    assert resp_body["status"] == 200
  end
end
