defmodule Redirect.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  @impl true
  def start(_type, _args) do
    endpoint_opts = Application.get_env(:redirect, :endpoint, [])
    port = Keyword.get(endpoint_opts, :port, 4000)
    scheme = Keyword.get(endpoint_opts, :scheme, :http)

    Logger.info("Starting server on port #{port}...")

    children = [
      {Plug.Cowboy, scheme: scheme, plug: Redirect, options: [port: port]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Redirect.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
