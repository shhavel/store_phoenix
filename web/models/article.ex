defmodule Store.Article do
  use Store.Web, :model

  schema "articles" do
    field :name, :string
    field :body, :string
    field :authors, :string
    field :genres, :string

    timestamps(inserted_at: :created_at)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :body, :authors, :genres])
    |> validate_required([:name, :body, :authors, :genres])
  end
end
