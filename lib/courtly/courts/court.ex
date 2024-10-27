defmodule Courtly.Courts.Court do
  use Ecto.Schema
  import Ecto.Changeset

  schema "courts" do
    field :title, :string
    field :body, :string
    field :status, :string
    field :default_price_in_cents, :integer
    field :latitude, :float
    field :longitude, :float
    field :city, :string
    field :state, :string

    belongs_to :owner, Courtly.Accounts.User, foreign_key: :owner_id
    has_many :bookings, Courtly.Bookings.Booking

    timestamps()
  end

  @doc false
  def changeset(court, attrs) do
    court
    |> cast(attrs, [
      :title,
      :body,
      :status,
      :default_price_in_cents,
      :latitude,
      :longitude,
      :city,
      :state,
      :owner_id
    ])
    |> validate_required([
      :title,
      :default_price_in_cents,
      :latitude,
      :longitude,
      :city,
      :state,
      :owner_id
    ])
    |> foreign_key_constraint(:owner_id)
  end
end
