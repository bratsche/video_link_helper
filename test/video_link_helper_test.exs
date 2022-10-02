defmodule VideoLinkHelperTest do
  use ExUnit.Case
  doctest VideoLinkHelper

  describe "video links" do
    @youtube_links [
      "http://www.youtube.com/v/0zM3nApSvMg?fs=1&hl=en_US&rel=0",
      "http://www.youtube.com/embed/0zM3nApSvMg?rel=0",
      "http://www.youtube.com/watch?v=0zM3nApSvMg&feature=feedrec_grec_index",
      "http://www.youtube.com/watch?v=0zM3nApSvMg",
      "http://youtu.be/0zM3nApSvMg",
      "http://www.youtube.com/watch?v=0zM3nApSvMg#t=0m10s",
      "http://youtu.be/0zM3nApSvMg",
      "http://www.youtube.com/embed/0zM3nApSvMg",
      "http://www.youtube.com/v/0zM3nApSvMg",
      "http://www.youtube.com/e/0zM3nApSvMg",
      "http://www.youtube.com/watch?v=0zM3nApSvMg",
      "http://www.youtube.com/?v=0zM3nApSvMg",
      "http://www.youtube.com/watch?feature=player_embedded&v=0zM3nApSvMg",
      "http://www.youtube.com/?feature=player_embedded&v=0zM3nApSvMg"
    ]

    @vimeo_links [
      "https://www.vimeo.com/148751763",
      "https://vimeo.com/148751763",
      "https://player.vimeo.com/video/148751763",
      "https://vimeo.com/148751763?app_id=123456"
    ]

    test "youtube links" do
      ids =
        @youtube_links
        |> Enum.map(fn url -> VideoLinkHelper.extract_id(url) end)

      assert true ==
               Enum.all?(ids, fn x ->
                 x == {:youtube, "0zM3nApSvMg"}
               end)
    end

    test "vimeo links" do
      ids =
        @vimeo_links
        |> Enum.map(fn url -> VideoLinkHelper.extract_id(url) end)

      assert true ==
               Enum.all?(ids, fn x ->
                 x == {:vimeo, "148751763"}
               end)
    end
  end

  describe "rendering embeds" do
    test "default youtube embed" do
      assert VideoLinkHelper.render_embed("dQw4w9WgXcQ") ==
               """
               <iframe width="560" height="315" src="https://www.youtube.com/embed/dQw4w9WgXcQ" style="border: none;" allowfullscreen></iframe>
               """
    end

    test "embed with custom sizes" do
      assert VideoLinkHelper.render_embed("dQw4w9WgXcQ", width: 640, height: 480) ==
               """
               <iframe width="640" height="480" src="https://www.youtube.com/embed/dQw4w9WgXcQ" style="border: none;" allowfullscreen></iframe>
               """
    end

    test "vimeo embed" do
      assert VideoLinkHelper.render_embed("148751763", video_type: :vimeo) ==
               """
               <iframe width="560" height="315" src="https://player.vimeo.com/video/148751763" style="border: none;" allowfullscreen></iframe>
               """
    end
  end
end
