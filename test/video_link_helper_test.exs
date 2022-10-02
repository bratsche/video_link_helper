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
end
