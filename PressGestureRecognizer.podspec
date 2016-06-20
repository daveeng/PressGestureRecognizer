Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "PressGestureRecognizer"
  s.version      = "1.0.0"
  s.summary      = "A Gesture Recognizer for the Apple TV remote."
  s.description  = "A Gesture Recognizer for tvOS that recognizes directional presses (clicks) on the Apple TV remote."

  s.homepage     = "https://github.com/davidengelhardt/PressGestureRecognizer"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = "MIT"

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author             = { "David Engelhardt" => "daengelhardt@gmail.com" }
  # Or just: s.author    = "David Engelhardt"
  # s.authors            = { "David Engelhardt" => "daengelhardt@gmail.com" }
  # s.social_media_url   = "http://twitter.com/David Engelhardt"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :tvos, "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/davidengelhardt/PressGestureRecognizer.git", :tag => "1.0.0" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files = "PressGestureRecognizer", "PressGestureRecognizer/**/*.{h,m,swift}"
  s.exclude_files = "PressGestureRecognizer/Exclude"

  # s.public_header_files = "PressGestureRecognizer/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
