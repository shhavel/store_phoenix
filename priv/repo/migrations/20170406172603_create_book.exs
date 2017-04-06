defmodule Store.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:books) do
      add :name, :string, null: false
      add :available, :boolean, default: false, null: false
      add :genres, :string, null: false
      add :authors, :string, null: false
      add :publisher, :string, null: false

      timestamps(inserted_at: :created_at, null: false)
    end
  end
end
