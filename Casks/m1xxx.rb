cask "m1xxx" do
  version "2.4.0-alpha-pre-0a15ae8"
  sha256 "f2c19c7e15e624a227bf1fbc1977b65fbf6a96d5fddc47ef90849f184f472b7a"

  url "https://github.com/fwcd/m1xxx/releases/download/v#{version}/mixxx-#{version.split('-').last}.dmg"
  name "M1xxx"
  desc "Unofficial Mixxx build for Apple Silicon (arm64 macOS)"
  homepage "https://github.com/fwcd/m1xxx"

  livecheck do
    url 'https://github.com/fwcd/m1xxx/releases/latest'
    regex /tag\/v([\w\.\-]+)/
    strategy :header_match do |headers, regex|
      next if headers['location'].blank?
      headers['location'].scan(regex).map { |match| match[0] }
    end
  end

  app "Mixxx.app"
end
