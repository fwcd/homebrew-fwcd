cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"
  deployment_target = on_arch_conditional arm:   "min1100",
                                          intel: "min1015"

  version "2.5.0.c46763.rb67d216702"
  sha256 arm:   "dbac37037e9b5675741d7de3fc44bb22ddecf0ac5ef943cdd9b96c9f2f4f541c",
         intel: "58bc8f2ccf92cfae73c4b27fc9cd01f319c276c740d89659560ee3f79bb6559c"

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
