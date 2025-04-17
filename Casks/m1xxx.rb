cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"

  deployment_target = "min1100"

  version "2.6.0.c50121.r8c2879726c"
  sha256 arm:   "e132da2cabe48aa65ac5e4ef36ca8f5bc9061b3f145f689f4bedbf6987b13eb2",
         intel: "84cff082346689f42ef95eb4bf846393fa7e71e9b99be4a6bb18236ddf0db58f"

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
