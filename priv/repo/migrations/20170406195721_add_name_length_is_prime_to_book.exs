defmodule Store.Repo.Migrations.AddNameLengthIsPrimeToBook do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :name_length_is_prime, :boolean, default: false, null: false
    end

    create index(:books, [:name_length_is_prime])
  end
end
