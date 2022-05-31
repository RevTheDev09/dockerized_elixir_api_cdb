defmodule BetApiWeb.UserController do
  use BetApiWeb, :controller

  alias BetApi.Accounts
  alias BetApi.Accounts.User

  action_fallback BetApiWeb.FallbackController

  def register(conn, %{"user" => user_params}) do
    with {:ok, user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> text("User successfully registered with email:" <> " " <> user.email)
    end
  end
end
