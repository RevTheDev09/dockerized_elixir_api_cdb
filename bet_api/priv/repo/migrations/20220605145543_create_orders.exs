defmodule BetApi.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :order_array, {:array, :string}
      add :total_price, :decimal
      add :email, :string

      timestamps()
    end
  end
end
