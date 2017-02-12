defmodule Mtnblog.User do
  use Mtnblog.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> hash_password
  end

  defp hash_password(changeset) do
    hash = Comeonin.Bcrypt.hashpwsalt(get_field(changeset, :password))
    put_change(changeset, :password_hash, hash)
  end
end
