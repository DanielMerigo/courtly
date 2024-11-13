defmodule CourtlyWeb.Client.CourtsLive.Index do
  use CourtlyWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:an_admin?, socket.assigns.current_user.is_admin?)

    {:ok, socket}
  end
end
