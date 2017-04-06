defmodule Store.HomePageTest do
  use Store.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Listing books"
  end
end
