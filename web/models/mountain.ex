defmodule Mtnblog.Mountain do
  use Mtnblog.Web, :model
  
  schema "mountains" do
    field :elevation, :float
    field :latitude, :float
    field :longitude, :float
    field :name, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:elevation, :latitude, :longitude, :name])
    |> validate_required([:elevation, :latitude, :longitude, :name])
  end
end
