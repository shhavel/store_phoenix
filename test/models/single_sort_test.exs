defmodule Store.SingleSortTest do
  use Store.ModelCase

  alias Store.SingleSort

  @valid_attrs %{book_id: 42, list_id: 42, position: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SingleSort.changeset(%SingleSort{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SingleSort.changeset(%SingleSort{}, @invalid_attrs)
    refute changeset.valid?
  end
end
