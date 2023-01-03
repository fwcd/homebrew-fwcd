cask "m1xxx" do
  version "2.4.0.c43243.rdca4e1c7be"
  sha256 "b31f10d6f9b00cc1b21f46d94dd07b1a5a69e7d86463d761a6603f8bf5ad49b1"

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

  app "Mixxx.app"
end
