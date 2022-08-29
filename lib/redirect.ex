defmodule Redirect do
  @moduledoc false

  @behaviour Plug

  import Plug.Conn

  @impl Plug
  def init(opts), do: opts

  @impl Plug
  def call(conn, _opts) do
    config = config!(conn)

    conn
    |> put_resp_header("location", build_uri(conn, config))
    |> send_resp(302, "You are being redirected to #{config.host}...")
    |> halt()
  end

  defp build_uri(conn, config) do
    %URI{
      scheme: to_string(config.scheme),
      host: config.host,
      query: conn.query_string,
      path: conn.request_path,
      port: config.port
    }
    |> URI.to_string()
  end

  defp config!(conn) do
    Application.fetch_env!(:redirect, __MODULE__)
    |> Enum.into(%{
      port: conn.port,
      scheme: conn.scheme
    })
  end
end
