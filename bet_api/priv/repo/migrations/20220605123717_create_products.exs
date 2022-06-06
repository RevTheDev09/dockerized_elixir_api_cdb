defmodule BetApi.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :product_name, :string
      add :price, :decimal
      add :quantity, :integer
      add :img_url, :string

      timestamps()
    end
  end
end
