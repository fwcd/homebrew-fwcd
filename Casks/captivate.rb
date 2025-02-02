cask "captivate" do
  arch arm:   "-arm64",
       intel: ""

  version "1.0.2.c601.r75dddd3"
  sha256 arm:   "dff487dca8c7a71dd6dec390addb756b445cc997ff3c98fe4612ba50fde420b6",
         intel: "2a6e3ece73a2388f0be66f8484a8547bf05871c2de2f5fd781a942cff0845aaf"

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
