defmodule Store.BookController do
  use Store.Web, :controller

  alias Store.Book

  def index(conn, params) do
    page = Repo.paginate(Book, params)
    render(conn, "index.html", books: page.entries, page: page)
  end

  def prime(conn, params) do
    page = Book
    |> Ecto.Query.where(name_length_is_prime: true)
    |> Repo.paginate(params)
    render(conn, "prime.html", books: page.entries, page: page)
  end
end
