import Config

config :redirect,
  endpoint: [
    port: 4000,
    scheme: :http
  ]

import_config "#{config_env()}.exs"
