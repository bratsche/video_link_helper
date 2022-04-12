defmodule VideoLinkHelper.MixProject do
  use Mix.Project

  @version "0.1.0"
  @description "Elixir utility library for dealing with embedded Youtube and Vimeo videos"

  def project do
    [
      app: :video_link_helper,
      version: @version,
      description: @description,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      source_url: "https://github.com/bratsche/video_link_helper"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/bratsche/video_link_helper"
      }
    ]
  end
end
