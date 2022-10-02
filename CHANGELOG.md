# Changelog

## 0.2.0

### Enhancements

  - New VideoComponent for use from heex templates.
  - New VideoLinkHelper.render_embed/2 API.

### Deprecations

  - VideoLinkHelper.create_youtube_embed/3 - use VideoLinkHelper.render_embed/2
  - VideoLinkHelper.create_vimeo_embed/3 - use VideoLinkHelper.render_embed/2

### Bug Fixes

  - Fixed "too many redirects" issue in Safari when on http.

## 0.1.0

Initial release.