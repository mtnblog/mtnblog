defmodule Mtnblog.Post do
  use Mtnblog.Web, :model

  schema "posts" do
    field :rating, :integer, default: 0
    field :url, :string
    field :title, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title, :rating])
    |> validate_required([:url, :title, :rating])
  end
end
