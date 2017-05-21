# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mtnblog,
  ecto_repos: [Mtnblog.Repo]

# Configures the endpoint
config :mtnblog, Mtnblog.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xlwqvrIMIGmwjwMG67pomWFsMFp53W0fj/AA6d+GRd0ZpsRPVl2ljL/oUKw4jpjc",
  render_errors: [view: Mtnblog.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mtnblog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures guardian authentication
config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Mtnblog",
  ttl: { 30, :days },
  verify_issuer: true,
  secret_key: "EAcHIzUPdHmSgkL6EFIUEOnrIPXn0ORG1TuvI/cIq2tVl1zwhTAPPVhZ3CMUkaMe",
  serializer: Mtnblog.GuardianSerializer

config :ex_admin,
  skin_color: :black,
  repo: Mtnblog.Repo,
  logo_mini: "<b>MTN</b>",
  logo_full: "<b>MTN</b>Admin",
  title: "MTNAdmin",
  module: Mtnblog,
  modules: [
    Mtnblog.ExAdmin.Category,
    Mtnblog.ExAdmin.Dashboard,
    Mtnblog.ExAdmin.Article,
    Mtnblog.ExAdmin.Photo,
    Mtnblog.ExAdmin.Video
  ]

config :scrivener_html,
  routes_helper: Mtnblog.Router.Helpers

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}

