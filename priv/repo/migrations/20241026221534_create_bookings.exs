defmodule MyApp.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :client_id, references(:users, on_delete: :delete_all), null: false
      add :court_id, references(:courts, on_delete: :delete_all), null: false
      add :total_price_in_cents, :integer, null: false
      add :status, :string
      add :start_date, :date, null: false
      add :end_date, :date, null: false

      timestamps()
    end

    create index(:bookings, [:client_id])
    create index(:bookings, [:court_id])

    create unique_index(:bookings, [:court_id, :start_date, :end_date],
             name: :unique_court_booking
           )
  end
end
