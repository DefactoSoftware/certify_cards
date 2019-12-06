# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :certify_cards,
  ecto_repos: [CertifyCards.Repo]

# Configures the endpoint
config :certify_cards, CertifyCardsWeb.Endpoint,
  server: true,
  url: [host: "localhost"],
  secret_key_base: "WO4B5kWC8MHMhcpi236WdL37FC8n0H0ixgtunL83I2uGUP2O3XGOUMJPrR413VGg",
  render_errors: [view: CertifyCardsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CertifyCards.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :certify_cards,
  client_id: System.get_env("CLIENT_ID"),
  client_secret: System.get_env("CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
