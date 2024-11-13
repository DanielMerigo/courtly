defmodule Courtly.Courts do
  @moduledoc """
  Module for managing court data
  """

  alias Courtly.Repo
  alias Courtly.Courts.Court

  import Ecto.Query

  def list_owner_courts(user_id) do
    Repo.all(from c in Court, where: c.owner_id == ^user_id)
  end
end
