import Config

config :redirect,
  endpoint: [
    port: 4001,
    scheme: :http
  ]

config :redirect, Redirect,
  host: "google.com",
  port: 443,
  scheme: :https

config :logger, level: :warning
