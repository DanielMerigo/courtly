defmodule Courtly.Bookings.BookingTest do
  use Courtly.DataCase

  alias Courtly.Bookings.Booking

  describe "changeset/2" do
    test "with required fields" do
      changeset =
        Booking.changeset(%Booking{}, %{
          client_id: 1,
          court_id: 1,
          total_price_in_cents: 100,
          start_date: ~D[2010-04-17],
          end_date: ~D[2010-04-17]
        })

      assert changeset.valid?

      assert changeset.changes == %{
               client_id: 1,
               court_id: 1,
               total_price_in_cents: 100,
               start_date: ~D[2010-04-17],
               end_date: ~D[2010-04-17]
             }
    end

    test "without required fields" do
      changeset = Booking.changeset(%Booking{}, %{})
      refute changeset.valid?

      assert changeset.errors == [
               client_id: {"can't be blank", [validation: :required]},
               court_id: {"can't be blank", [validation: :required]},
               total_price_in_cents: {"can't be blank", [validation: :required]},
               start_date: {"can't be blank", [validation: :required]},
               end_date: {"can't be blank", [validation: :required]}
             ]
    end
  end
end
