import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :bet_api, BetApi.Repo,
  username: "root",
  password: "",
  database: "bet_api_dev",
  hostname: "127.0.0.1",
  port: 26257,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  migration_lock: false

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bet_api, BetApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "eLArepxBACltaxnlHTq3XfwN6Y0arTKyrYrj9U2wA5RHCjqEJnT0mWd5Zag8xJ4P",
  server: false

# In test we don't send emails.
config :bet_api, BetApi.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
