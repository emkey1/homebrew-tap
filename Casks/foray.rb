cask "foray" do
  version "0.10.5"
  sha256 "230feee20bac16e452f05ad881b97655fe21457cee33065b5b4ecdef3aaeb6c9"

  url "https://github.com/emkey1/Foray/releases/download/v#{version}/Foray-#{version}.dmg"
  name "Foray"
  desc "File browser that does what Finder does, minus the parts that get in the way"
  homepage "https://github.com/emkey1/Foray"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

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
