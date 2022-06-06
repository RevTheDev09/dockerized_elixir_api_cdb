defmodule BetApi.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias BetApi.Repo

  alias BetApi.Inventory.Product

  @doc """
  Returns the list of products.
  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.
  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.
  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.
  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.
  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.
  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  def get_product_by_id(id) do
    query = from(p in Product, where: p.id == ^id)

    case Repo.one(query) do
      nil -> {:error, :not_found}
      product -> {:ok, product}
    end
  end

  def update_stock_qty(qty, id) do
    stock = get_product_by_id(id)
    stock = Ecto.Changeset.change stock, quantity: quantity - qty
    case Repo.update stock do
      {:ok, struct} ->
        "Success"
      {:error, changeset} ->
        "Low stock"
    end
  end
end
