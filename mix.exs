defmodule VideoLinkHelper.MixProject do
  use Mix.Project

  @version "0.2.0"
  @description "Elixir utility library for dealing with embedded Youtube and Vimeo videos"

  def project do
    [
      app: :video_link_helper,
      version: @version,
      description: @description,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      source_url: "https://github.com/bratsche/video_link_helper"
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:jason, "~> 1.0"},
      {:phoenix_live_view, "~> 0.18"}
    ]
  end

  defp docs do
    [
      main: "VideoLinkHelper",
      source_ref: "v#{@version}",
      source_url: "https://github.com/bratsche/video_link_helper",
      extras: ["CHANGELOG.md"],
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"]
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
