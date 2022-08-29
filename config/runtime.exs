import Config

if config_env() == :prod do
  ## Endpoint config

  config :redirect, endpoint: [
    port: System.get_env("ENDPOINT_PORT", "443") |> String.to_integer(),
    scheme: System.get_env("ENDPOINT_SCHEME", "https") |> String.to_existing_atom()
  ]

  ## Redirect config

  config :redirect, Redirect, host: System.fetch_env!("REDIRECT_HOST")

  if port = System.get_env("REDIRECT_PORT") do
    config :redirect, Redirect, port: String.to_integer(port)
  end

  if scheme = System.get_env("REDIRECT_SCHEME") do
    config :redirect, Redirect, scheme: scheme
  end
else
  config :redirect, Redirect,
    host: "google.com",
    port: 443,
    scheme: :https
end
