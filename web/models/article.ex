defmodule Mtnblog.Article do
  use Mtnblog.Web, :model
  alias Mtnblog.Category

  schema "articles" do
    field :author, :string
    field :content, :string
    field :feature_image, :string
    field :published, :boolean
    field :slug, :string
    field :title, :string     
    belongs_to :category, Category

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:author, :content, :feature_image, :published, :slug, :title])
    |> validate_required([:author, :content, :feature_image, :published, :slug, :title])
  end
end
