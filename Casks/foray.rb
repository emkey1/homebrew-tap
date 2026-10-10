cask "foray" do
  version "0.10.0"
  sha256 "08eaf418d5efa9908b81d13d7c7a98395f0b72750783041d48226352c9d24596"

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
  binary "#{appdir}/Foray.app/Contents/Helpers/foray"

  # Quit a running Foray before upgrading or removing it, so the next launch is the new version.
  uninstall quit: "io.github.emkey1.Foray"

  zap trash: [
    "~/Library/Application Support/Foray",
    "~/Library/Caches/io.github.emkey1.Foray",
    "~/Library/HTTPStorages/io.github.emkey1.Foray",
    "~/Library/Preferences/io.github.emkey1.Foray.plist",
    "~/Library/Saved Application State/io.github.emkey1.Foray.savedState",
  ]
end
