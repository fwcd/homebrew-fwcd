cask "m1xxx" do
  arch arm:   "arm64",
       intel: "x64"

  deployment_target = "min1100"

  version "2.7.0.c50426.rfc07d3248e"
  sha256 arm:   "56647b6a02a5364f93c067e2e787f6c21b53f8ba203441d81e29342b7c5fc06c",
         intel: "956aabea93c48dc5a743c75fd926e408ee8d8cd1952c1c11a9ac5bc923385285"

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
