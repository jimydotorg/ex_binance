defmodule ExBinance.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_binance,
      version: "0.1.2",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      name: "ExBinance",
      description: "Binance API client for Elixir",
      source_url: "https://github.com/jimydotorg/ex_binance",
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.12.0"},
      {:poison, "~> 3.1"},
      {:mock, "~> 0.2.1", only: :test},
      {:credo, "~> 0.8.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.16.2", only: :dev, runtime: false},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "ExBinance",
      extras: ["README.md"],
    ]
  end

  defp package do
    [
      name: :ex_binance,
      maintainers: ["None"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/jimydotorg/ex_binance"}
    ]
  end
end
