defmodule Store.ArticleController do
  use Store.Web, :controller

  alias Store.Article

  def index(conn, params) do
    page = Repo.paginate(Article, params)
    render(conn, "index.html", articles: page.entries, page: page)
  end
end
