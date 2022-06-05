defmodule BetApiWeb.OrderController do
  use BetApiWeb, :controller

  alias BetApi.Orders

  action_fallback BetApiWeb.FallbackController

  def index(conn, _params) do
    orders = Orders.list_orders()
    render(conn, "index.json", orders: orders)
  end

  def place_order(conn, %{"order" => order_params}) do
    # add validation check for quantity and update quantity after successful order
    with {:ok, order} <- Orders.create_order(order_params) do
      IO.inspect(order)
      conn
      |> put_status(:created)
      render(conn, "orders.json", order: order)
    end
  end
end
