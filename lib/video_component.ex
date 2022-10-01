defmodule VideoLinkHelper.VideoComponent do
  use Phoenix.Component

  attr :id, :string, required: true
  attr :video_type, :string, default: "youtube"
  attr :width, :integer, required: true
  attr :height, :integer, required: true

  def video(assigns) do
    ~H"""
    <iframe width={@width} height={@height} src={src(@id, @video_type)} style="border: none;" allowfullscreen></iframe>
    """
  end

  # -- private functions

  defp src(id, "youtube") do
    "https://www.youtube.com/embed/#{id}"
  end

  defp src(id, "vimeo") do
    "https://player.vimeo.com/video/#{id}"
  end
end
