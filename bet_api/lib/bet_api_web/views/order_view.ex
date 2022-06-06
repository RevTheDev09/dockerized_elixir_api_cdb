defmodule BetApiWeb.OrderView do
  use BetApiWeb, :view
  alias BetApiWeb.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "orders.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "orders.json")}
  end

  def render("orders.json", %{order: order}) do
    %{
      id: order.id,
      total_price: order.total_price,
      order_array: order.order_array,
      email: order.email
    }
  end
end
