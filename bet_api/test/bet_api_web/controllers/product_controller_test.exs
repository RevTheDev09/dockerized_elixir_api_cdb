defmodule BetApiWeb.ProductControllerTest do
  use BetApiWeb.ConnCase

  import BetApi.InventoryFixtures

  alias BetApi.Inventory.Product

  @create_attrs %{
    no-context: "some no-context",
    no-schema: "some no-schema",
    price: "120.5",
    product_id: 42,
    product_name: "some product_name",
    quantity: 42,
    —: "some —"
  }
  @update_attrs %{
    no-context: "some updated no-context",
    no-schema: "some updated no-schema",
    price: "456.7",
    product_id: 43,
    product_name: "some updated product_name",
    quantity: 43,
    —: "some updated —"
  }
  @invalid_attrs %{"no-context": nil, "no-schema": nil, price: nil, product_id: nil, product_name: nil, quantity: nil, "—": nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, Routes.product_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product" do
    test "renders product when data is valid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "no-context" => "some no-context",
               "no-schema" => "some no-schema",
               "price" => "120.5",
               "product_id" => 42,
               "product_name" => "some product_name",
               "quantity" => 42,
               "—" => "some —"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product" do
    setup [:create_product]

    test "renders product when data is valid", %{conn: conn, product: %Product{id: id} = product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "no-context" => "some updated no-context",
               "no-schema" => "some updated no-schema",
               "price" => "456.7",
               "product_id" => 43,
               "product_name" => "some updated product_name",
               "quantity" => 43,
               "—" => "some updated —"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, product: product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product" do
    setup [:create_product]

    test "deletes chosen product", %{conn: conn, product: product} do
      conn = delete(conn, Routes.product_path(conn, :delete, product))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.product_path(conn, :show, product))
      end
    end
  end

  defp create_product(_) do
    product = product_fixture()
    %{product: product}
  end
end
