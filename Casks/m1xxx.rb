cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"
  deployment_target = on_arch_conditional arm:   "min1100",
                                          intel: "min1015"

  version "2.5.0.c46897.r2d2d5f304b"
  sha256 arm:   "7cef44e17bc4eaf15b3786c6b4dced52f426e8d34ab61f6fde1308831c5ae97a",
         intel: "c72d9f91da960b37205c565e75166523bf7a8cabc923867c77b8e32282ed5e2a"

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
