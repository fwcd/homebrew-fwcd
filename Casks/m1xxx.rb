cask "m1xxx" do
  version "2.4.0.c43277.rf20501ea4c"
  sha256 "fbcfd1e4ebb95c5603dfa7012f258f8b0f103204943753af3d555893c1dd0500"

  url "https://github.com/fwcd/m1xxx/releases/download/v#{version}/mixxx-#{version}.dmg"
  name "M1xxx"
  desc "Unofficial Mixxx build for Apple Silicon"
  homepage "https://github.com/fwcd/m1xxx"

  livecheck do
    url "https://github.com/fwcd/m1xxx/releases/latest"
    regex %r{tag/v([\w.-]+)}
    strategy :header_match do |headers, regex|
      next if headers["location"].blank?

      headers["location"].scan(regex).map { |match| match[0] }
    end
  end

  app "Mixxx.app"
end
