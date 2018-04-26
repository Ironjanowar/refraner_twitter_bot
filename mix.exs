defmodule RefranerTwitterBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :refraner_twitter_bot,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:extwitter],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:oauther, "~> 1.1"},
      {:extwitter, "~> 0.8"},
      {:tesla, "1.0.0-beta.1"},
      {:jason, ">= 1.0.0"}
    ]
  end
end
