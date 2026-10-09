cask "foray" do
  version "0.9.2"
  sha256 "c70cfd685509f78a60d3e6bdd509d2c9b1e66a3afd2f4f1d42cbc33847d0e02a"

  url "https://github.com/emkey1/Foray/releases/download/v#{version}/Foray-#{version}.dmg"
  name "Foray"
  desc "File browser that does what Finder does, minus the parts that get in the way"
  homepage "https://github.com/emkey1/Foray"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Foray.app"

  zap trash: [
    "~/Library/Application Support/Foray",
    "~/Library/Caches/io.github.emkey1.Foray",
    "~/Library/HTTPStorages/io.github.emkey1.Foray",
    "~/Library/Preferences/io.github.emkey1.Foray.plist",
    "~/Library/Saved Application State/io.github.emkey1.Foray.savedState",
  ]
end
