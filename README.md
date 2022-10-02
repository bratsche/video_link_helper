# VideoLinkHelper

[![Actions Status](https://github.com/bratsche/video_link_helper/actions/workflows/elixir/badge.svg)](https://github.com/bratsche/video_link_helper/actions?query=workflow%3ACI)

This is a simple library to help deal with embedded video links. It
allows you to extract the ID from a video link, and can use that ID
to generate an iframe to embed the video into a web application.

This library supports Youtube and Vimeo links.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `video_link_helper` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:video_link_helper, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/video_link_helper>.

## License

This is licensed under the [MIT license](LICENSE.md).
