defmodule Mtnblog.SessionController do
  use Mtnblog.Web, :controller
  alias Mtnblog.User

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case login(email, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Signed in.")
        |> Guardian.Plug.sign_in(user)
        |> redirect(to: "/admin")
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> put_flash(:info, "Signed out.")
    |> redirect(to: "/")
  end

  def login(email, password) do
    user = Repo.get_by(User, email: email)
    case authenticate(user, password) do
      true  -> {:ok, user}
      false -> {:error, "Invalid email or password."}
      {:error, reason} -> {:error, reason}
    end
  end

  def authenticate(user, password) do
    case user do
      nil ->
        Comeonin.Bcrypt.dummy_checkpw()
        {:error, "User not found."}
      user ->
        Comeonin.Bcrypt.checkpw(password, user.password_hash)
    end
  end

  def unauthenticated(conn, _) do
    conn
    |> put_flash(:error, "Authentication required.")
    |> redirect(to: "/login")
  end
end
