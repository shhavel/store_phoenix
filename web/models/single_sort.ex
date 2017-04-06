defmodule Store.SingleSort do
  use Store.Web, :model

  schema "single_sorts" do
    field :list_id, :integer
    field :book_id, :integer
    field :position, :integer

    timestamps(inserted_at: :created_at)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:list_id, :book_id, :position])
    |> validate_required([:list_id, :book_id, :position])
  end
end
