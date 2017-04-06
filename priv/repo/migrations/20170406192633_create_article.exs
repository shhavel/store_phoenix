defmodule Store.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:articles) do
      add :name, :string, null: false
      add :body, :text, null: false
      add :authors, :string, null: false
      add :genres, :string, null: false

      timestamps(inserted_at: :created_at, null: false)
    end
  end
end
