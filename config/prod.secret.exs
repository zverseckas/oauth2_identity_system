use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :eeval, EevalWeb.Endpoint,
  secret_key_base: "GpMGc5pFfdzh+yD8U/HR7amlvNzPoMF0Zf6BP4zjSVHZ1jlfjm9DLgPQ99+OzUsJ"

# Configure your database
config :eeval, Eeval.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "eeval_prod",
  pool_size: 15
