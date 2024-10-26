defmodule MyApp.Repo.Migrations.CreateCourts do
  use Ecto.Migration

  def change do
    create table(:courts) do
      add :title, :string, null: false
      add :body, :text
      add :owner_id, references(:users, on_delete: :delete_all), null: false
      add :status, :string
      add :default_price_in_cents, :integer, null: false

      add :latitude, :float, null: false
      add :longitude, :float, null: false
      add :city, :string, null: false
      add :state, :string, null: false

      timestamps()
    end

    create index(:courts, [:latitude, :longitude])
    create index(:courts, [:owner_id])
  end
end
