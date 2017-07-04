defmodule ElixirElastic.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixir_elastic,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "ElixirElastic",
      source_url: "https://github.com/wlchn/elixir_elastic"
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:exjsx, :logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [ {:exjsx, "~> 3.2.0"} ]
  end

  defp description do
    """
    A simple Elixir Elasticsearch HTTP client.
    """
  end

  defp package do
    [
      name: :elixir_elastic,
      files: ["lib", "mix.exs", "README*", "LICENSE*", "test", "config", "deps"],
      maintainers: ["wlchn"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/wlchn/elixir_elastic"}
    ]
  end
end
