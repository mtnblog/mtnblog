defmodule Mtnblog.Photo do
  use Mtnblog.Web, :model

  schema "photos" do
    field :image, :string
    field :location, :string
    field :title, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:image, :location, :title])
    |> validate_required([:image, :location, :title])
  end
end
