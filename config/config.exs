# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :savepass,
  ecto_repos: [Savepass.Repo]

# Configures the endpoint
config :savepass, Savepass.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/HBay2AuOXY3gUq3JKEQwzfsCP+ZFdz/b4hnGNzJsaP6V5DTuys7u0dfiiXmyLlh",
  render_errors: [view: Savepass.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Savepass.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
