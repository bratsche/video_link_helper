defmodule VideoLinkHelper do
  @youtube_regex ~r{^.*(?:youtu.be\/|v\/|e\/|u\/\w+\/|embed\/|v=)([^#\&\?]*).*}
  @vimeo_regex ~r{(?:http:|https:|)\/\/(?:player.|www.)?vimeo\.com\/(?:video\/|embed\/|watch\?\S*v=|v\/)?(\d*)}

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

  def create_youtube_embed(id, height, width) do
    """
    <iframe width="#{width}" height="#{height}" src="//www.youtube.com/embed/#{id}" style="border: none;" allowfullscreen></iframe>
    """
  end

  def create_vimeo_embed(id, height, width) do
    """
    <iframe height="#{height}" width="#{width}" src="//player.vimeo.com/video/#{id}" style="border: none;" allowfullscreen></iframe>
    """
  end
end
