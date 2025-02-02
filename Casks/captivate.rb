cask "captivate" do
  arch arm:   "-arm64",
       intel: ""

  version "1.0.2.c610.r57d864e"
  sha256 arm:   "1bf349edd35d2c4d9f3a2d37421d0aa3d3d219a2697eabac30200c3945f715f8",
         intel: "102c152ae5157c1f4b92bc650a0a901e2aa1e1520e7226c76c8e294d72f9e05d"

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
