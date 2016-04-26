defmodule Readit.Mixfile do
  use Mix.Project

  def project do
    [app: :readit,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A Simple Read-Only Reddit API Client",
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:mix]]
  end

  defp deps do
    [
      {:ex_doc,    "~> 0.11", only: [:dev]},
      {:poison,    "~> 2.1"},
      {:httpoison, "~> 0.8"}
    ]
  end

  defp package do
    [files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Adam Zaninovich"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/adamzaninovich/readit",
              "Docs"   => "https://github.com/adamzaninovich/readit"}]
  end
end
