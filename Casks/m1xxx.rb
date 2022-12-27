cask "m1xxx" do
  version "2.4.0.c43227.r86a280b5e0"
  sha256 "6bef9f260301d36686297422f8f86e38d389c57d20a68ce2446703bbb36a51a6"

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
