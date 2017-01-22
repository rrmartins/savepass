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

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Savepass.User,
  repo: Savepass.Repo,
  module: Savepass,
  require_current_password: true,
  logged_out_url: "/",
  email_from_name: "Rodrigo Martins",
  email_from_email: "rrmartinsjg@gmail.com",
  opts: [
    :trackable, :invitable, :rememberable,
    :authenticatable, :recoverable, :lockable,
    :unlockable_with_token, :registerable
  ]

config :coherence, Savepass.Coherence.Mailer,
  adapter: Swoosh.Adapters.Local
  # adapter: Swoosh.Adapters.Sendgrid,
  # api_key: "your api key here"
# %% End Coherence Configuration %%
