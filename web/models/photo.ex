defmodule Mtnblog.Photo do
  use Mtnblog.Web, :model
  alias Mtnblog.Category

  schema "photos" do
    field :image, :string
    field :location, :string
    field :title, :string
    belongs_to :category, Category

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:image, :location, :title])
    |> validate_required([:image, :location, :title])
  end
end
