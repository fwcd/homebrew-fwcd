cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"
  deployment_target = on_arch_conditional arm:   "min1100",
                                          intel: "min1015"

  version "2.5.0.c45889.r8a5855cebc"
  sha256 arm:   "b9fa267f8811f1afcf6d22e35855fa0166a6a020e91caa6152b249e1533fe861",
         intel: "47b7129d8ee1f2ed23e6bba4e3d49dff9df40bc47d75fce9333ea1dec610856c"

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
