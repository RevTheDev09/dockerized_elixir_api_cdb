defmodule BetApi.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :product_id, :integer
      add :product_name, :string
      add :price, :decimal
      add :quantity, :integer

      timestamps()
    end
  end
end
