defmodule BetApi.InventoryTest do
  use BetApi.DataCase

  alias BetApi.Inventory

  describe "products" do
    alias BetApi.Inventory.Product

    import BetApi.InventoryFixtures

    @invalid_attrs %{price: nil, product_id: nil, product_name: nil, quantity: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Inventory.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Inventory.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{price: "120.5", product_id: 42, product_name: "some product_name", quantity: 42}

      assert {:ok, %Product{} = product} = Inventory.create_product(valid_attrs)
      assert product.price == Decimal.new("120.5")
      assert product.product_id == 42
      assert product.product_name == "some product_name"
      assert product.quantity == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{price: "456.7", product_id: 43, product_name: "some updated product_name", quantity: 43}

      assert {:ok, %Product{} = product} = Inventory.update_product(product, update_attrs)
      assert product.price == Decimal.new("456.7")
      assert product.product_id == 43
      assert product.product_name == "some updated product_name"
      assert product.quantity == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_product(product, @invalid_attrs)
      assert product == Inventory.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Inventory.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Inventory.change_product(product)
    end
  end

  describe "products" do
    alias BetApi.Inventory.Product

    import BetApi.InventoryFixtures

    @invalid_attrs %{"no-context": nil, "no-schema": nil, price: nil, product_id: nil, product_name: nil, quantity: nil, "—": nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Inventory.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Inventory.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{"no-context": "some no-context", "no-schema": "some no-schema", price: "120.5", product_id: 42, product_name: "some product_name", quantity: 42, "—": "some —"}

      assert {:ok, %Product{} = product} = Inventory.create_product(valid_attrs)
      assert product.no-context == "some no-context"
      assert product.no-schema == "some no-schema"
      assert product.price == Decimal.new("120.5")
      assert product.product_id == 42
      assert product.product_name == "some product_name"
      assert product.quantity == 42
      assert product.— == "some —"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{"no-context": "some updated no-context", "no-schema": "some updated no-schema", price: "456.7", product_id: 43, product_name: "some updated product_name", quantity: 43, "—": "some updated —"}

      assert {:ok, %Product{} = product} = Inventory.update_product(product, update_attrs)
      assert product.no-context == "some updated no-context"
      assert product.no-schema == "some updated no-schema"
      assert product.price == Decimal.new("456.7")
      assert product.product_id == 43
      assert product.product_name == "some updated product_name"
      assert product.quantity == 43
      assert product.— == "some updated —"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_product(product, @invalid_attrs)
      assert product == Inventory.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Inventory.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Inventory.change_product(product)
    end
  end
end
