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
    |> send_resp(config.status, "You are being redirected to #{config.host}...")
    |> halt()
  end

  defp build_uri(conn, config) do
    %URI{
      scheme: to_string(config.scheme),
      host: config.host,
      query: query(conn.query_string),
      path: path(conn.request_path),
      port: config.port
    }
    |> URI.to_string()
  end

  defp query(""), do: nil
  defp query(query), do: query

  defp path("/"), do: nil
  defp path(path), do: path

  defp config!(conn) do
    Application.fetch_env!(:redirect, __MODULE__)
    |> Enum.into(%{
      port: conn.port,
      scheme: conn.scheme,
      status: 302
    })
  end
end
