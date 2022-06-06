defmodule BetApiWeb.OrderController do
  use BetApiWeb, :controller

  alias BetApi.Orders
  alias BetApi.Accounts

  action_fallback BetApiWeb.FallbackController

  def index(conn, _params) do
    orders = Orders.list_orders()
    render(conn, "index.json", orders: orders)
  end

  def place_order(conn, %{"order" => order_params}) do
    # add validation check for quantity and update quantity after successful order
    # check if user exists by email - change to using email check
    case check_user_exists(order_params["email"]) do
      {:error, :not_found} ->
        body = Jason.encode!(%{error: "user_not_found"})

        conn |> send_resp(401, body)

      _ ->
        with {:ok, order} <- Orders.create_order(order_params) do
          conn
          |> put_status(:created)

          render(conn, "orders.json", order: order)
        end
    end
  end

  defp check_user_exists(email) do
    case Accounts.get_by_email(email) do
      {:ok, user} ->
        user

      {:error, :not_found} ->
        {:error, :not_found}
    end
  end
end
