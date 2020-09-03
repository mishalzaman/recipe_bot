defmodule RecipeBot.Parsers.AllRecipes do
  import Logger

  def parse(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Floki.parse_document(body) do
          {:ok, document} ->
            Logger.info "RecipeBot.Scrapers.AllRecipes.parse/1: Parsing document for url: #{url}"
            Logger.info "Hash: #{Base.encode16(:erlang.md5(url), case: :lower)}"

            data = %{
              tile: title(document),
              prep_minutes: prep_minutes(document),
              cook_minutes: cook_minutes(document),
              total_minutes: total_minutes(document),
              serving: serving(document),
              ingredients: ingredients(document),
              directions: directions(document),
              nutrition_information: nutrition_information(document),
              module: __MODULE__
            }

            IO.inspect data

          {:error} ->
            Logger.error "Error::RecipeBot.Scrapers.AllRecipes.parse/1: parsing document with URL: #{url}"
        end

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error "Error::RecipeBot.Scrapers.AllRecipes.parse/1: retrieving from URL: #{url}, reason: #{reason}"
    end
  end

  defp title(document) do
    document
    |> Floki.find(".intro")
    |> Floki.find(".headline")
    |> Floki.text
    |> String.trim
  end

  defp prep_minutes(document) do
    document
    |> Floki.find(".two-subcol-content-wrapper:first-child")
    |> Floki.find(".recipe-meta-item:first-child")
    |> Floki.find(".recipe-meta-item-body")
    |> Floki.text
    |> String.trim
    |> String.replace(~r/( mins)/, "")
    |> String.to_integer
  end

  defp cook_minutes(document) do
    document
    |> Floki.find(".two-subcol-content-wrapper:first-child")
    |> Floki.find(".recipe-meta-item:nth-of-type(2)")
    |> Floki.find(".recipe-meta-item-body")
    |> Floki.text
    |> String.trim
    |> String.replace(~r/( mins)/, "")
    |> String.to_integer
  end

  defp total_minutes(document) do
    document
    |> Floki.find(".two-subcol-content-wrapper:first-child")
    |> Floki.find(".recipe-meta-item:nth-of-type(3)")
    |> Floki.find(".recipe-meta-item-body")
    |> Floki.text
    |> String.trim
    |> String.replace(~r/( mins)/, "")
    |> String.to_integer
  end

  defp serving(document) do
    document
    |> Floki.find(".two-subcol-content-wrapper:last-child")
    |> Floki.find(".recipe-meta-item:first-child")
    |> Floki.find(".recipe-meta-item-body")
    |> Floki.text
    |> String.trim
    |> String.to_integer
  end

  defp ingredients(document) do
    document
    |> Floki.find(".ingredients-item-name")
    |> Floki.text
    |> String.replace(~r/ +/, " ")
    |> String.trim
    |> String.split("\n")
    |> Enum.reject(fn(item) ->
      item == " "
    end)
    |> Enum.map(fn(item) ->
      String.trim(item)
    end)
  end

  def directions(document) do
    document
    |> Floki.find(".instructions-section__fieldset")
    |> Floki.find(".paragraph")
    |> Enum.map(fn(d) ->
      Floki.text(d)
    end)
  end

  def nutrition_information(document) do
    document
    |> Floki.find(".recipe-nutrition")
    |> Floki.find(".nutrition-row")
    |> Enum.map(fn(x) ->
      x
      |> Floki.find(".nutrient-name")
      |> Floki.text
      |> String.replace(~r/ +/, " ")
      |> String.replace("\n", "")
    end)
  end
end

# RecipeBot.Parsers.AllRecipes.parse("https://www.allrecipes.com/recipe/21528/pesto-pizza/")
# RecipeBot.Parsers.AllRecipes.parse("https://www.allrecipes.com/recipe/281347/frozen-zabaglione/")
