cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"

  deployment_target = "min1100"

  version "2.6.0.c49484.r4b827a11f2"
  sha256 arm:   "0fdf1ebfb2e4f848f9f2b8627bd8f2c0eca2a5ca30d1f17a1e99e4ef51af4e7f",
         intel: "84982b3784dd4171c701bf6094b3eea6b7d26e8b75da3abec91f95a262a6765b"

  url "https://github.com/fwcd/m1xxx/releases/download/v#{version}/mixxx-#{version}-#{arch}-osx-#{deployment_target}-release.dmg"
  name "M1xxx"
  desc "Free and Open Source DJ software (unofficial build)"
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
