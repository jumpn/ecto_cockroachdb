defmodule EctoCockroachDB.MixProject do
  use Mix.Project

  @version "1.0.0"

  def project do
    [
      app: :ecto_cockroachdb,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "CockroachDB Ecto Adaptor",
      description: "CockroachDB adaptor for Ecto",
      source_url: "https://github.com/jumpn/ecto_cockroachdb",
      docs: docs(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: ["README.md"]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.20", only: :dev},
      {:ecto, "~> 3.1"},
      {:ecto_sql, "~> 3.1"},
      {:postgrex, ">= 0.14.3"}
    ]
  end

  defp package do
    [
      maintainers: ["Christian Meunier"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/jumpn/ecto_cockroachdb"}
    ]
  end
end
