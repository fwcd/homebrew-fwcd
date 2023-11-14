cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"
  deployment_target = on_arch_conditional arm:   "min1100",
                                          intel: "min1015"

  version "2.5.0.c45901.r3252675a03"
  sha256 arm:   "b2d106429db9af9d6d26b4c56c039b68f33fb271d20857c0281800553f497884",
         intel: "127deaaf685b4583f3f1bc1f64d0916084ebbabb0800a269113f2ba9d90de8cd"

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
