defmodule Mtnblog.Post do
  use Mtnblog.Web, :model

  schema "posts" do
    field :image, :string
    field :url, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:image, :url])
    |> validate_required([:image, :url])
  end
end
