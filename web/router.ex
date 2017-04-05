defmodule Mtnblog.Router do
  use Mtnblog.Web, :router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug Guardian.Plug.EnsureAuthenticated, handler: Mtnblog.SessionController    
  end


  scope "/", Mtnblog do
    pipe_through :browser

    get "/", PageController, :home

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete

    get "/mountains", MountainController, :index

    get "/news", PostController, :index

    get "/photos", PhotoController, :index
    get "/photos/:id", PhotoController, :show

    get "/videos", VideoController, :index
    get "/videos/:id", VideoController, :show
  end

  scope "/admin", ExAdmin do
    pipe_through [:browser, :auth]
    admin_routes()
  end
end
