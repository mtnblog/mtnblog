defmodule Mtnblog.Router do
  use Mtnblog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :csrf do
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Mtnblog do
    pipe_through [:browser, :csrf] # Use the default browser stack

    get  "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Mtnblog do
  #   pipe_through :api
  # end
end
