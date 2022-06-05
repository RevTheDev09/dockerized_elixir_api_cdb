defmodule BetApi.Orders do
  import Ecto.Query, warn: false

  alias BetApi.Repo
  alias BetApi.Store.Order

  def list_orders do
    Repo.all(Order)
  end

  def create_order(attrs) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  def get_by_id(id) do
    Order |> Repo.get!(id)
  end
end
