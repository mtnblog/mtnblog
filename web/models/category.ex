defmodule Mtnblog.Category do
  use Mtnblog.Web, :model
  alias Mtnblog.{Article, Photo, Post, Podcast, Video}

  schema "categories" do
    field :title, :string
    has_many :photos, Photo
    has_many :posts, Post
    has_many :videos, Video

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
