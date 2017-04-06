defmodule Store.Repo.Migrations.CreateList do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:lists) do
      add :name, :string, null: false

      timestamps(inserted_at: :created_at, null: false)
    end
  end
end
