defmodule Mtnblog.Podcast do
  use Mtnblog.Web, :model
  alias Mtnblog.Category

  schema "photos" do
    field :url, :string
    field :title, :string     
    belongs_to :category, Category

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title])
    |> validate_required([:url, :title])
  end
end
