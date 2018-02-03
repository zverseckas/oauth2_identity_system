# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :eeval,
  ecto_repos: [Eeval.Repo]

config :eeval, Eeval.Auth.Guardian,
  issuer: "eval",
  secret_key: "CgiukB74lFL7M/D+qHkok6TInmiHxxQPNbpfSc+vCH2q8mtSp2SUzDePXWmkYzua"

config :eeval, Eeval.Mailer,
  adapter: Bamboo.LocalAdapter

config :bcrypt_elixir, log_rounds: 4

# Configures the endpoint
config :eeval, EevalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MfYQrE+2rGKDFYaJW6EAxEP3tyHGlO1WHFgVxrsodNDaXTPSubaA0ytW6N6ui2Q8",
  render_errors: [view: EevalWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Eeval.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
