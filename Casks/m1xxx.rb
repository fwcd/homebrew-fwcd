cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"
  deployment_target = on_arch_conditional arm:   "min1100",
                                          intel: "min1015"

  version "2.5.0.c45973.r650b5da250"
  sha256 arm:   "b0cd8404e59619407ba9d62d35ff9690ee89bed758cf9647d749203b2c64e8be",
         intel: "74920671cfc8fe0612eeff01d9e19389f2a2cfe2abf0b761a18ea312bb65a1e0"

  url "https://github.com/fwcd/m1xxx/releases/download/v#{version}/mixxx-#{arch}-osx-#{deployment_target}-#{version}.dmg"
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
