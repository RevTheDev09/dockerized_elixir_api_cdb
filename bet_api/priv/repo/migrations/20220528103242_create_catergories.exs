defmodule BetApi.Repo.Migrations.CreateCatergories do
  use Ecto.Migration

  def up do
    execute(
      """
      CREATE TABLE categories(
        id UUID NOT NULL DEFAULT gen_random_uuid(),
        name STRING
        timestamp INT8 NOT NULL,
      );
      """
    )
  end

  def down do
    drop table("categories")
  end
end
