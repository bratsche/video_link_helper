# VideoLinkHelper

[![Actions Status](https://github.com/bratsche/video_link_helper/actions/workflows/elixir.yml/badge.svg)](https://github.com/bratsche/video_link_helper/actions?query=workflow%3ACI)

This is a simple library to help deal with embedded video links. It
allows you to extract the ID from a video link, and can use that ID
to generate an iframe to embed the video into a web application.

This library supports Youtube and Vimeo links.

## Installation

This package can be installed by adding `video_link_helper` to your
list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:video_link_helper, "~> 0.2.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/video_link_helper>.

## Usage

Extract an identifier from a Youtube or Vimeo URL:

```elixir
VideoLinkHelper.extract_id("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
```

This will return a tuple containing the video type and the ID of the video,
for example:

```elixir
{:youtube, "dQw4w9WgXcQ"}
```

A video can be embedded on a page in one of two ways:

 - Using the function component:
```elixir
import VideoLinkHelper.VideoComponent

~H"""
<.video id="dQw4w9WgXcQ" video_type="youtube" width="560" height="315" />
"""
```

 - Using the raw HTML function:
 ```elixir
raw(VideoLinkHelper.create_youtube_embed("dQw4w9WgXcQ", 315, 560))
 ```

## License

This is licensed under the [MIT license](LICENSE.md).
