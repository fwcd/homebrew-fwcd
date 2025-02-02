cask "captivate" do
  arch arm:   "-arm64",
       intel: ""

  version "1.0.2.c606.rc6ffa3f"
  sha256 arm:   "4b9bc102f517b538119c6b57152d23aa822a5ca28535a0d78218e0f49272436e",
         intel: "626ac07c57973f8b4e9f6a395165addad64be8266ea3229f3a81f61dba778b0a"

  url "https://github.com/fwcd/captivate/releases/download/v#{version}/Captivate-#{version[/^\d+(?:\.\d+)*/]}#{arch}.dmg"
  name "Captivate"
  desc "Visual & Lighting Synth (unofficial fork)"
  homepage "https://github.com/fwcd/captivate"

  livecheck do
    url "https://github.com/fwcd/captivate/releases/latest"
    regex %r{tag/v([\w.-]+)}
    strategy :header_match do |headers, regex|
      next if headers["location"].blank?

      headers["location"].scan(regex).map { |match| match[0] }
    end
  end

  app "Captivate.app"
end
