use Mix.Config

config :etbot,
  port: (System.get_env("PORT") || "8443") |> String.to_integer(),
  token: System.get_env("TOKEN"),
  url: "https://api.telegram.org/bot" <> System.get_env("TOKEN") <> "/"
