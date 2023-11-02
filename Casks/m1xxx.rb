cask "m1xxx" do
  version "2.5.0.c45781.r8a8b162368"
  sha256 "f98e679fa194e390e85573e64a8df1f62c5bfa1da2956cfeb21f4dc9af2fc801"

  url "https://github.com/fwcd/m1xxx/releases/download/v#{version}/mixxx-#{version}.dmg"
  name "M1xxx"
  desc "Unofficial Mixxx build for Apple Silicon"
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
