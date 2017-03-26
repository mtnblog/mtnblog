defmodule Mtnblog.Video do
  use Mtnblog.Web, :model
  alias Mtnblog.Category

  schema "videos" do
    field :description, :string
    field :image, :string
    field :location, :string
    field :title, :string
    field :url, :string
    belongs_to :category, Category

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :image, :location, :title, :url])
    |> validate_required([:image, :location, :title, :url])
  end
end
