defmodule Store.BookController do
  use Store.Web, :controller

  alias Store.Book

  def index(conn, params) do
    page = Repo.paginate(Book, params)
    render(conn, "index.html", books: page.entries, page: page)
  end
end
