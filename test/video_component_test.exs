defmodule VideoComponentTest do
  use ExUnit.Case
  import Phoenix.LiveViewTest

  doctest VideoLinkHelper.VideoComponent

  describe "VideoComponent" do
    test "youtube video" do
      assert render_component(&VideoLinkHelper.VideoComponent.video/1, id: "dQw4w9WgXcQ", width: 560, height: 315) ==
        "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/dQw4w9WgXcQ\" style=\"border: none;\" allowfullscreen></iframe>"
    end

    test "vimeo video" do
      assert render_component(&VideoLinkHelper.VideoComponent.video/1, id: "7819433", video_type: "vimeo", width: 560, height: 315) ==
        "<iframe width=\"560\" height=\"315\" src=\"https://player.vimeo.com/video/7819433\" style=\"border: none;\" allowfullscreen></iframe>"
    end
  end
end
