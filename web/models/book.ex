defmodule Store.Book do
  use Store.Web, :model

  schema "books" do
    field :name, :string
    field :available, :boolean, default: false
    field :genres, :string
    field :authors, :string
    field :publisher, :string
    field :name_length_is_prime, :boolean, default: false

    timestamps(inserted_at: :created_at)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :available, :genres, :authors, :publisher, :name_length_is_prime])
    |> validate_required([:name, :available, :genres, :authors, :publisher, :name_length_is_prime])
  end
end
