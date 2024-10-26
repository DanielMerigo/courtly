defmodule Courtly.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CourtlyWeb.Telemetry,
      Courtly.Repo,
      {DNSCluster, query: Application.get_env(:courtly, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Courtly.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Courtly.Finch},
      # Start a worker by calling: Courtly.Worker.start_link(arg)
      # {Courtly.Worker, arg},
      # Start to serve requests, typically the last entry
      CourtlyWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Courtly.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CourtlyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
