defmodule Etbot.Mixfile do
  use Mix.Project

  def project do
    [ app: :etbot,
      version: "0.1.0",
      elixir: "~> 1.3",
      deps: deps() ]
  end

  def application do
    [ mod: {Etbot, []},
      applications: [:logger, :httpotion, :cowboy, :plug, :poison, :postgrex, :ecto] ]
  end

  defp deps do
    [
      {:httpotion, "~> 3.0.3"},
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:poison, "~> 3.1.0"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 2.1.3"}
    ]
  end
end
