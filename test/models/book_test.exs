defmodule Store.BookTest do
  use Store.ModelCase

  alias Store.Book

  @valid_attrs %{authors: "some content", available: true, genres: "some content", name: "some content", publisher: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Book.changeset(%Book{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Book.changeset(%Book{}, @invalid_attrs)
    refute changeset.valid?
  end
end
