defmodule Store.Repo.Migrations.AssignNameLengthIsPrimeForAllBooks do
  use Ecto.Migration

  alias Store.Repo
  alias Store.Book

  def change do
    Book
    |> Repo.all
    |> Enum.each(fn(book) ->
      if is_prime(String.length(book.name)) do
        changeset = Book.changeset(book, %{name_length_is_prime: true})
        Repo.update!(changeset)
      end
    end)
  end

  defp is_prime(x) do
    (2..x |> Enum.filter(fn a -> rem(x, a) == 0 end) |> length()) == 1
  end
end
