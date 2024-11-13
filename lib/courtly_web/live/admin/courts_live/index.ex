defmodule CourtlyWeb.Admin.CourtsLive.Index do
  use CourtlyWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    courts = Courtly.Courts.list_owner_courts(socket.assigns.current_user.id)

    socket =
      socket
      |> assign(:an_admin?, socket.assigns.current_user.is_admin?)
      |> assign(:courts, courts)

    {:ok, socket}
  end
end
