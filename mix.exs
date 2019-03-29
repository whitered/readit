defmodule Readit.Mixfile do
  use Mix.Project

  def project do
    [app: :readit,
     version: "0.1.0",
     elixir: "~> 1.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A Simple Read-Only Reddit API Client",
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:mix, :httpoison]]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:poison, "~> 3.0"},
      {:httpoison, "~> 1.1"}
    ]
  end

  defp package do
    [files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Adam Zaninovich"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/adamzaninovich/readit"}]
  end
end
