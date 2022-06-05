defmodule BetApi.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BetApi.Inventory` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        price: "120.5",
        product_id: 42,
        product_name: "some product_name",
        quantity: 42
      })
      |> BetApi.Inventory.create_product()

    product
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        no-context: "some no-context",
        no-schema: "some no-schema",
        price: "120.5",
        product_id: 42,
        product_name: "some product_name",
        quantity: 42,
        —: "some —"
      })
      |> BetApi.Inventory.create_product()

    product
  end
end
