defmodule BetApi.Store.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias BetApi.Inventory.Product
  schema "orders" do

    field :total_price, :decimal
    field :order_array, {:array, :string}
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:total_price, :order_array, :user_id])
    |> validate_required([:total_price, :order_array, :user_id])
  end
end
