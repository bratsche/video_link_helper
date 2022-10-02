defmodule VideoLinkHelper do
  @moduledoc """
  A helper for extracting IDs from video (Youtube or Vimeo) URLs and
  rendering embeds for those IDs.

  """

  @youtube_regex ~r{^.*(?:youtu.be\/|v\/|e\/|u\/\w+\/|embed\/|v=)([^#\&\?]*).*}
  @vimeo_regex ~r{(?:http:|https:|)\/\/(?:player.|www.)?vimeo\.com\/(?:video\/|embed\/|watch\?\S*v=|v\/)?(\d*)}

  @doc """
  Extracts an ID from a link and identifies it as either a Youtube or Vimeo link.

  ## Examples
      iex> VideoLinkHelper.extract_id("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
      {:youtube, "dQw4w9WgXcQ"}

  """
  def extract_id(nil), do: nil

  def extract_id(url) do
    cond do
      url =~ @youtube_regex ->
        [_, id] = Regex.run(@youtube_regex, url)
        {:youtube, id}

      url =~ @vimeo_regex ->
        [_, id] = Regex.run(@vimeo_regex, url)
        {:vimeo, id}

      true ->
        nil
    end
  end

  @default_width 560
  @default_height 315
  @default_type :youtube

  @doc """
  Renders HTML for a video embed.

  ## Options

  * `:width` - Width of the video embed. Default is 560.
  * `:height` - Height of the video embed. Default is 315.
  * `:video_type` - The type of video embed to render. Must be
  either `:youtube` or `:vimeo`. If this option is not provided,
  the default is `:youtube`.

  Returns a string.

  """
  @doc since: "0.2.0"
  def render_embed(id, options \\ []) do
    width = Keyword.get(options, :width, @default_width)
    height = Keyword.get(options, :height, @default_height)
    video_type = Keyword.get(options, :video_type, @default_type)

    create_embed(id, height, width, to_string(video_type))
  end

  @doc deprecated: "Use VideoLinkHelper.render_embed/2 instead."
  def create_youtube_embed(id, height, width), do: create_embed(id, height, width, "youtube")

  @doc deprecated: "Use VideoLinkHelper.render_embed/2 instead."
  def create_vimeo_embed(id, height, width), do: create_embed(id, height, width, "vimeo")

  # -- private functions

  defp create_embed(id, height, width, "youtube") do
    """
    <iframe width="#{width}" height="#{height}" src="https://www.youtube.com/embed/#{id}" style="border: none;" allowfullscreen></iframe>
    """
  end

  defp create_embed(id, height, width, "vimeo") do
    """
    <iframe width="#{width}" height="#{height}" src="https://player.vimeo.com/video/#{id}" style="border: none;" allowfullscreen></iframe>
    """
  end

  defp create_embed(_id, _height, _width, video_type) do
    raise "Invalid video type: #{inspect(video_type)}"
  end
end
