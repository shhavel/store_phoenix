defmodule Store.Book do
  use Store.Web, :model

  schema "books" do
    field :name, :string
    field :available, :boolean, default: false
    field :genres, :string
    field :authors, :string
    field :publisher, :string

    timestamps(inserted_at: :created_at)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :available, :genres, :authors, :publisher])
    |> validate_required([:name, :available, :genres, :authors, :publisher])
  end
end
