defmodule Store.SearchController do
  use Store.Web, :controller

  alias Store.Book
  alias Store.Article
  alias Store.Search

  def filter(conn, params) do
    books = if is_map(params["search"]) && (
      is_binary(params["search"]["name"]) and params["search"]["name"] != "" ||
      is_binary(params["search"]["genre"]) and params["search"]["genre"] != "" ||
      is_binary(params["search"]["author"]) and params["search"]["author"] != "" ||
      is_binary(params["search"]["publisher"]) and params["search"]["publisher"] != "") do
      Book
      |> Search.filter_by_name(params)
      |> Search.filter_by_genre(params)
      |> Search.filter_by_author(params)
      |> Search.filter_by_publisher(params)
      |> Repo.all
    end

    articles = if is_map(params["search"]) && (
      is_binary(params["search"]["name"]) and params["search"]["name"] != "" ||
      is_binary(params["search"]["genre"]) and params["search"]["genre"] != "" ||
      is_binary(params["search"]["author"]) and params["search"]["author"] != "" ||
      is_binary(params["search"]["publisher"]) and params["search"]["publisher"] != "") do
      Article
      |> Search.filter_by_name(params)
      |> Search.filter_by_genre(params)
      |> Search.filter_by_author(params)
      |> Repo.all
    end

    render(conn, "filter.html", books: books, articles: articles)
  end
end
