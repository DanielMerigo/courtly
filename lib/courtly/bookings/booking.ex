defmodule Courtly.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :total_price_in_cents, :integer
    field :status, :string
    field :start_date, :date
    field :end_date, :date

    belongs_to :client, Courtly.Accounts.User, foreign_key: :client_id
    belongs_to :court, Courtly.Courts.Court

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [
      :client_id,
      :court_id,
      :total_price_in_cents,
      :status,
      :start_date,
      :end_date
    ])
    |> validate_required([
      :client_id,
      :court_id,
      :total_price_in_cents,
      :start_date,
      :end_date
    ])
    |> validate_number(:total_price_in_cents, greater_than_or_equal_to: 0)
    |> validate_inclusion(:status, ["pending", "confirmed", "cancelled"])
    |> foreign_key_constraint(:client_id)
    |> foreign_key_constraint(:court_id)
    |> unique_constraint([:court_id, :start_date, :end_date], name: :unique_court_booking)
  end
end
