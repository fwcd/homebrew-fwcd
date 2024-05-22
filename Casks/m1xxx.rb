cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"

  deployment_target = "min1100"

  version "2.5.0.c47654.r9893d7510c"
  sha256 arm:   "70030f669610b41222a77afae7a8fcc22df0311eb175910e79882805367c542f",
         intel: "02cd11184982c450448489f4a906af2a42ab9a4d8cdf915259a4d8e165761f05"

  url "https://github.com/fwcd/m1xxx/releases/download/v#{version}/mixxx-#{version}-#{arch}-osx-#{deployment_target}-release.dmg"
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
