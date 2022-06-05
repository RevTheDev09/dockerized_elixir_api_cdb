# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BetApi.Repo.insert!(%BetApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

BetApi.Repo.insert!(
  %BetApi.Inventory.Product{
    product_id: 1,
    product_name: "Batman TShirt",
    price: 150.00,
    quantity: 1000
  }
)
BetApi.Repo.insert!(
  %BetApi.Inventory.Product{
    product_id: 2,
    product_name: "Batgirl TShirt",
    price: 50.00,
    quantity: 2000
  }
)

BetApi.Repo.insert!(
  %BetApi.Inventory.Product{
    product_id: 3,
    product_name: "Batman Cape",
    price: 1500.00,
    quantity: 1000
  }
)
