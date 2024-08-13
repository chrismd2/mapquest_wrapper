defmodule MapquestWrapper.MixProject do
  use Mix.Project

  @source_url "https://github.com/chrismd2/mapquest_wrapper"

  def project do
    [
      app: :mapquest_wrapper,
      version: System.get_env("PROJECT_VERSION"),
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "MapquestWrapper",
      source_url: @source_url
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
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.0"},
    ]
  end

  defp description() do
    "A wrapper for interacting with MapQuest."
  end

  defp package() do
    [
      files: ~w(lib priv .formatter.exs mix.exs README* readme* LICENSE*
                license* CHANGELOG* changelog* src),
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
