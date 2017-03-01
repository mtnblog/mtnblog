defmodule Mtnblog.Post do
  use Mtnblog.Web, :model
  alias Mtnblog.Category  

  schema "posts" do
    field :rating, :integer, default: 0
    field :url, :string
    field :title, :string
    belongs_to :category, Category

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title, :rating, :category_id])
    |> validate_required([:url, :title, :rating])
  end
end
