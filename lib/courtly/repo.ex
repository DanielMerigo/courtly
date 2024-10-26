defmodule Courtly.Repo do
  use Ecto.Repo,
    otp_app: :courtly,
    adapter: Ecto.Adapters.Postgres
end
