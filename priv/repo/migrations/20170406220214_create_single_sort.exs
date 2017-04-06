defmodule Store.Repo.Migrations.CreateSingleSort do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:single_sorts) do
      add :list_id, :integer, null: false
      add :book_id, :integer, null: false
      add :position, :integer, null: false

      timestamps(inserted_at: :created_at, null: false)
    end
  end
end
