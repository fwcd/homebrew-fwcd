cask "m1xxx" do
  arch arm: "arm64"
  
  version "2.5.0.c45818.r30bca40dad"
  sha256 arm: "52bd2cb34c7a766fde17694b95bf1623c7f66c4cc7bc2e60d0a43ea44303b2e2"

  url "https://github.com/fwcd/m1xxx/releases/download/v#{version}/mixxx-#{arch}-osx-#{version}.dmg"
  name "M1xxx"
  desc "Unofficial build of the Free and Open Source DJ software Mixxx"
  homepage "https://github.com/fwcd/m1xxx"

  livecheck do
    url "https://github.com/fwcd/m1xxx/releases/latest"
    regex %r{tag/v([\w.-]+)}
    strategy :header_match do |headers, regex|
      next if headers["location"].blank?

      headers["location"].scan(regex).map { |match| match[0] }
    end
  end

  conflicts_with cask: "mixxx"

  app "Mixxx.app"
end
