cask "captivate" do
  arch arm:   "-arm64",
       intel: ""

  version "1.0.0"
  sha256 arm:   "962e0731f780a4176a67a8c99bb83db427dc2d1c517766c4201f36b762f5205f",
         intel: "8a32de665cf9c1bcd4ba42cef53cd60d8b1df9a68256bf56218beb682a8e99c9"

  url "https://github.com/spensbot/captivate/releases/download/v#{version}/Captivate-#{version}#{arch}.dmg"
  name "Captivate"
  desc "Visual & Lighting Synth"
  homepage "https://github.com/spensbot/captivate"

  livecheck do
    url "https://github.com/spensbot/captivate/releases/latest"
    regex %r{tag/v([\w.-]+)}
    strategy :header_match do |headers, regex|
      next if headers["location"].blank?

      headers["location"].scan(regex).map { |match| match[0] }
    end
  end

  app "Captivate.app"
end
