cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"
  deployment_target = on_arch_conditional arm:   "min1100",
                                          intel: "min1015"

  version "2.5.0.c46027.r2c2e706b44"
  sha256 arm:   "21b1fa03e9e3e442353b69ee7dcc22b92e265526443461f6e0a9c5d5fb28739f",
         intel: "7ba5dea795e288967df412384bffbce0d2b80c2fbd66c4651a654582b4c010d8"

  url "https://github.com/fwcd/m1xxx/releases/download/v#{version}/mixxx-#{version}-#{arch}-osx-#{deployment_target}.dmg"
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
