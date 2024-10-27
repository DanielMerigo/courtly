defmodule Courtly.Courts.CourtTest do
  use Courtly.DataCase

  alias Courtly.Courts.Court

  describe "changeset/2" do
    test "with required fields" do
      changeset =
        Court.changeset(%Court{}, %{
          title: "some title",
          default_price_in_cents: 100,
          latitude: 0.0,
          longitude: 0.0,
          city: "Curitiba",
          state: "PR",
          owner_id: 1
        })

      assert changeset.valid?

      assert changeset.changes == %{
               title: "some title",
               default_price_in_cents: 100,
               latitude: 0.0,
               longitude: 0.0,
               city: "Curitiba",
               state: "PR",
               owner_id: 1
             }
    end

    test "without required fields" do
      changeset = Court.changeset(%Court{}, %{})
      refute changeset.valid?

      assert changeset.errors == [
               title: {"can't be blank", [validation: :required]},
               default_price_in_cents: {"can't be blank", [validation: :required]},
               latitude: {"can't be blank", [validation: :required]},
               longitude: {"can't be blank", [validation: :required]},
               city: {"can't be blank", [validation: :required]},
               state: {"can't be blank", [validation: :required]},
               owner_id: {"can't be blank", [validation: :required]}
             ]
    end
  end
end
