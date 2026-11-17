# Homebrew cask for the Akev desktop app (rendered by scripts/package-manifests.sh).
cask "akev-desktop" do
  version "0.1.0"
  sha256 "2253f427771d341416e50265f72c0a912b04a0f4e3a67e1b6b71bc97f7fc03a4"

  url "https://github.com/akevdev/akev/releases/download/v#{version}/Akev_#{version}_universal.dmg"
  name "Akev"
  desc "Fast HTTP(S) debugging proxy: intercept, inspect, mock and replay traffic"
  homepage "https://akev.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself (signed packages, after the user confirms).
  auto_updates true
  depends_on :macos

  app "Akev.app"

  zap trash: [
    "~/Library/Application Support/akev",
    "~/Library/Application Support/dev.akev.desktop",
    "~/Library/Caches/dev.akev.desktop",
    "~/Library/Preferences/dev.akev.desktop.plist",
    "~/Library/Saved Application State/dev.akev.desktop.savedState",
    "~/Library/WebKit/dev.akev.desktop",
  ]

  caveats <<~EOS
    Akev isn't notarized by Apple yet, so macOS asks before the first launch:
    open Akev once, then click "Open Anyway" in System Settings > Privacy & Security.
  EOS
end
