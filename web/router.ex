defmodule Store.Router do
  use Store.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Store do
    pipe_through :browser # Use the default browser stack

    get "/", BookController, :index
    resources "/books", BookController, only: [:index]
    get "/books/prime", BookController, :prime
    resources "/articles", ArticleController, only: [:index]
    get "/search/filter", SearchController, :filter
    get "/lists/books", ListController, :books
  end

  # Other scopes may use custom stacks.
  # scope "/api", Store do
  #   pipe_through :api
  # end
end
