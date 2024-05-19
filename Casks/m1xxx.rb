cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"

  deployment_target = "min1100"

  version "2.5.0.c47584.rde2b3ecd52"
  sha256 arm:   "310cdea97ce5126bbd1409cf4410e39739fa2882c3630c85c16660e9cb1136c9",
         intel: "6d8b7f6b095cb8b4695aa9bf1d7afaad69564d7ed29a10116636f9753c5f5787"

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
