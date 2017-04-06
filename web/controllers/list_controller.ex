defmodule Store.ListController do
  use Store.Web, :controller

  alias Store.List
  alias Store.SingleSort
  alias Store.Book

  def books(conn, _params) do
    entries = from(l in List,
      join: s in SingleSort, on: s.list_id == l.id,
      join: b in Book, on: b.id == s.book_id,
      where: s.id in fragment("(SELECT id FROM single_sorts WHERE list_id = ? ORDER BY position LIMIT 5)", l.id),
      select: {l.name, b.name},
      order_by: l.id)
    |> Repo.all
    |> Enum.group_by(&(elem(&1, 0)))


    IO.puts "=====  books  ====="
    IO.inspect entries
    IO.puts ""
    IO.puts "==================="


    render(conn, "books.html", entries: entries)
  end
end
