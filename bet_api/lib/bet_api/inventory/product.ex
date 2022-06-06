defmodule BetApi.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :price, :decimal
    field :product_name, :string
    field :quantity, :integer
    field :img_url, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:product_name, :price, :quantity, :img_url])
    |> validate_required([:product_name, :price, :quantity, :img_url])
  end
end
