defmodule BetApiWeb.ProductView do
  use BetApiWeb, :view
  alias BetApiWeb.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      product_id: product.product_id,
      product_name: product.product_name,
      price: product.price,
      quantity: product.quantity,
    }
  end
end
