defmodule Store.Repo.Migrations.AddSingleSortsIndexesOnListIdAndBookId do
  use Ecto.Migration

  def change do
    create index(:single_sorts, [:list_id])
    create index(:single_sorts, [:book_id])
  end
end
