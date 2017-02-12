defmodule Mtnblog.Video do
  use Mtnblog.Web, :model

  schema "videos" do
    field :image, :string
    field :location, :string
    field :title, :string
    field :url, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:image, :location, :title, :url])
    |> validate_required([:image, :location, :title, :url])
  end
end
