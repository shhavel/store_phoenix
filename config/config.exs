# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :store,
  ecto_repos: [Store.Repo]

# Configures the endpoint
config :store, Store.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6h4NPYbQrFZzNf0hGia0cTUNrpUWfYFzZlL5yKBdqNE8BGiaGvTvZLfl1YZL2DPk",
  render_errors: [view: Store.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Store.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
