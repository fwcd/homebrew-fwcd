cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"
  deployment_target = "min1100"

  version "2.5.0.c47341.r67a41d9dcd"
  sha256 arm:   "36d1ba7ad20b2fa361afeb6b1d17dcfbed5200b0565815a9473ba3e4397d0371",
         intel: "ef528f4d7446cd54786d890d397e3ffa5bc3f5d051d6e53e0ecd62bef30a94f9"

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
