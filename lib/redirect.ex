defmodule Redirect do
  @moduledoc false

  @behaviour Plug

  import Plug.Conn

  @impl Plug
  def init(opts), do: opts

  @impl Plug
  def call(conn, _opts) do
    config = config!()

    conn
    |> put_resp_header("location", build_uri(conn, config))
    |> send_resp(config.status, "You are being redirected to #{config.host}...")
    |> halt()
  end

  defp build_uri(conn, config) do
    %URI{
      scheme: to_string(config.scheme),
      host: config.host,
      port: config.port,
      path: path(conn.request_path),
      query: query(conn.query_string)
    }
    |> URI.to_string()
  end

  defp query(""), do: nil
  defp query(query), do: query

  defp path("/"), do: nil
  defp path(path), do: path

  defp config! do
    Application.fetch_env!(:redirect, __MODULE__)
    |> Enum.into(%{
      port: 443,
      scheme: :https,
      status: 302
    })
  end
end
