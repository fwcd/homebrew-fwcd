cask "m1xxx" do
  version "2.4.0.c43294.r804c447785"
  sha256 "4f4afa96f8732664cfe05de94b4beaba723ded9140a5a1a2cbe19b0a0cd42393"

  url "https://github.com/fwcd/m1xxx/releases/download/v#{version}/mixxx-#{version}.dmg"
  name "M1xxx"
  desc "Unofficial Mixxx build for Apple Silicon"
  homepage "https://github.com/fwcd/m1xxx"

  conflicts_with cask: "mixxx"

  livecheck do
    url "https://github.com/fwcd/m1xxx/releases/latest"
    regex %r{tag/v([\w.-]+)}
    strategy :header_match do |headers, regex|
      next if headers["location"].blank?

      headers["location"].scan(regex).map { |match| match[0] }
    end
  end

  app "Mixxx.app"
end
