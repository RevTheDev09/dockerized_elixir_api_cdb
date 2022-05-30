defmodule BetApi.Repo do
  use Ecto.Repo,
    otp_app: :bet_api,
    adapter: Ecto.Adapters.Postgres
end
