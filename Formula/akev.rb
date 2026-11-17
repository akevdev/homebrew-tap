# Homebrew formula for the akev command-line tool (rendered by scripts/package-manifests.sh).
class Akev < Formula
  desc "Fast HTTP(S) debugging proxy: intercept, inspect, mock and replay traffic"
  homepage "https://akev.dev"
  version "0.1.0"
  license "AGPL-3.0-or-later"

  on_macos do
    url "https://github.com/akevdev/akev/releases/download/v0.1.0/akev-0.1.0-universal-apple-darwin.tar.gz"
    sha256 "6283c632c71bdb972cf02baeedf71792db5242c1fc19e555425715111f652e89"
  end

  on_linux do
    on_intel do
      url "https://github.com/akevdev/akev/releases/download/v0.1.0/akev-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b67e154d5ba413b0da4e5fa18ceb28e4a79aff1cbe84afc1eadb6ce85ff91822"
    end
    on_arm do
      url "https://github.com/akevdev/akev/releases/download/v0.1.0/akev-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7ceb77e7465523f0accaf6e8c33ad2a46b55b98e7aae39e1fd759a2172ac2a8"
    end
  end

  def install
    bin.install "akev"
    doc.install "README.md", "CHANGELOG.md"
    (share/"licenses/akev").install "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/akev --version")
  end
end
