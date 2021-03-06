defmodule ETS.MixProject do
  use Mix.Project

  def project do
    [
      app: :ets,
      version: "0.8.1",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      docs: [main: "ETS", extras: ["README.md"]],
      package: package(),
      source_url: "https://github.com/TheFirstAvenger/ets",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      aliases: aliases(),
      dialyzer: [
        ignore_warnings: ".dialyzer_ignore.exs",
        list_unused_filters: true,
        plt_file: {:no_warn, "priv/plts/ets.plt"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_unit_notifier, "~> 0.1.4", only: :test},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:earmark, "~> 1.4.3", only: :dev, runtime: false},
      {:ex_doc, "~> 0.21.2", only: :dev, runtime: false},
      {:excoveralls, "~> 0.12.1", only: :test},
      {:credo, "~> 1.2.0-rc1", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.7", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    "Elixir wrapper for the Erlang :ets module."
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/TheFirstAvenger/ets"}
    ]
  end

  defp aliases do
    [
      compile: ["compile --warnings-as-errors"]
    ]
  end
end
