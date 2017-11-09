defmodule Etbot.Mixfile do
  use Mix.Project

  def project do
    [ app: :etbot,
      version: "0.0.1",
      elixir: "~> 1.3",
      deps: deps() ]
  end

  def application do
    [ applications: [:logger, :httpotion, :poison] ]
  end

  defp deps do
    [
      {:httpotion, "~> 3.0.3"},
      {:poison, "~> 3.1.0"}
    ]
  end
end
