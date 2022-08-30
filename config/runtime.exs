import Config

if config_env() == :prod do
  ## Endpoint config

  config :redirect,
    endpoint: [
      port: System.get_env("ENDPOINT_PORT", "4000") |> String.to_integer(),
      scheme: System.get_env("ENDPOINT_SCHEME", "http") |> String.to_existing_atom()
    ]

  ## Redirect config

  config :redirect, Redirect, host: System.fetch_env!("REDIRECT_HOST")

  if port = System.get_env("REDIRECT_PORT") do
    config :redirect, Redirect, port: String.to_integer(port)
  end

  if scheme = System.get_env("REDIRECT_SCHEME") do
    config :redirect, Redirect, scheme: scheme
  end

  if status = System.get_env("REDIRECT_STATUS") do
    config :redirect, Redirect, status: String.to_integer(status)
  end
end
