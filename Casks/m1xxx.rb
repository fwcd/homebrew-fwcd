cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"

  deployment_target = "min1100"

  version "2.7.0.c50317.r019eab1780"
  sha256 arm:   "846bf1158f2916dfcceec45ad2244be86af6066f168ec264470ba3f6a2baae97",
         intel: "57120fdcfb75cc39b0a97b161fc02042ac3d83ac3ff7dfab3ea6bb375c000199"

  url "https://github.com/fwcd/m1xxx/releases/download/v#{version}/mixxx-#{version}-#{arch}-osx-#{deployment_target}-release.dmg"
  name "M1xxx"
  desc "Free and Open Source DJ software (unofficial build)"
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
