cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"
  deployment_target = on_arch_conditional arm:   "min1100",
                                          intel: "min1015"

  version "2.5.0.c45977.rc1665e50e9"
  sha256 arm:   "6c1c6e14ca93306c18022dca875d6784a609362a6ce2622eb247fbee485ce1aa",
         intel: "082f7645cb5be5fdbe020558679b4917c14bfcfef3194991682bbb9463b50561"

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
