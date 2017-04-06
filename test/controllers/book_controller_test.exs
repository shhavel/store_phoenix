defmodule Store.BookControllerTest do
  use Store.ConnCase

  alias Store.Book

  test "lists all entries on index", %{conn: conn} do
    Repo.insert! %Book{name: "Vanity Fair", available: false, genres: "Western, Metafiction", authors: "Ilene D'Amore, Madaline Osinski", publisher: "Holt McDougal"}
    Repo.insert! %Book{name: "Have His Carcase", available: false, genres: "Western, Folklore, Science fiction", authors: "Hilario Morissette", publisher: "Atheneum Books"}
    Repo.insert! %Book{name: "The Mirror Crack'd from Side to Side", available: false, genres: "Classic, Essay, Folklore", authors: "Louisa Gottlieb, Ashley Bradtke III", publisher: "Tammi"}
    Repo.insert! %Book{name: "A Summer Bird-Cage", available: true, genres: "Realistic fiction, Science fiction, Essay", authors: "Madaline Osinski", publisher: "Carnegie Mellon University Press"}
    conn = get conn, book_path(conn, :index)
    response_text = html_response(conn, 200)
    assert response_text =~ "Listing books"
    assert response_text =~ "Vanity Fair"
    assert response_text =~ "Realistic fiction, Science fiction, Essay"
  end
end
