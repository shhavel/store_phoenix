defmodule Store.BookControllerTest do
  use Store.ConnCase

  alias Store.Book

  setup %{conn: conn} do
    Repo.insert! %Book{name: "Vanity Fair", name_length_is_prime: true, available: false, genres: "Western, Metafiction", authors: "Ilene D'Amore, Madaline Osinski", publisher: "Holt McDougal"}
    Repo.insert! %Book{name: "Have His Carcase", name_length_is_prime: false, available: false, genres: "Western, Folklore, Science fiction", authors: "Hilario Morissette", publisher: "Atheneum Books"}
    Repo.insert! %Book{name: "The Mirror Crack'd from Side to Side", name_length_is_prime: false, available: false, genres: "Classic, Essay, Folklore", authors: "Louisa Gottlieb, Ashley Bradtke III", publisher: "Tammi"}
    Repo.insert! %Book{name: "A Summer Bird-Cage", name_length_is_prime: false, available: true, genres: "Realistic fiction, Science fiction, Essay", authors: "Madaline Osinski", publisher: "Carnegie Mellon University Press"}
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, book_path(conn, :index)
    response_text = html_response(conn, 200)
    assert response_text =~ "Listing books"
    assert response_text =~ "Vanity Fair"
    assert response_text =~ "Realistic fiction, Science fiction, Essay"
    assert response_text =~ "Have His Carcase"
    assert response_text =~ "The Mirror Crack&#39;d from Side to Side"
    assert response_text =~ "A Summer Bird-Cage"
  end

  test "lists all books where the length of the name is a prime number", %{conn: conn} do
    conn = get conn, book_path(conn, :prime)
    response_text = html_response(conn, 200)
    assert response_text =~ "Listing books where the length of the name is a prime number"
    assert response_text =~ "Vanity Fair"
    refute response_text =~ "Have His Carcase"
    refute response_text =~ "The Mirror Crack&#39;d from Side to Side"
    refute response_text =~ "A Summer Bird-Cage"
  end
end
