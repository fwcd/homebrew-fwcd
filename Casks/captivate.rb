cask "captivate" do
  arch arm:   "-arm64",
       intel: ""

  version "1.0.3.c614.r63e7c59"
  sha256 arm:   "7cee4cd50759e027cf7aa13fb089722a146c781a621243dca6a3f1d42ffb2e98",
         intel: "25b9e6d559f6cdad392b289b1dc98934817f5a7042aa2c0772cc8b09ee693e68"

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
