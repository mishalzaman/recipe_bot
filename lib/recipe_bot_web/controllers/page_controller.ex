defmodule RecipeBotWeb.PageController do
  use RecipeBotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
