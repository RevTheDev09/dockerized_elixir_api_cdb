defmodule BetApi.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do

    field :price, :decimal
    field :product_id, :integer
    field :product_name, :string
    field :quantity, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:product_id, :product_name, :price, :quantity])
    |> validate_required([:product_id, :product_name, :price, :quantity])
  end
end
