# Homebrew formula for the akev command-line tool (rendered by scripts/package-manifests.sh).
class Akev < Formula
  desc "Fast HTTP(S) debugging proxy: intercept, inspect, mock and replay traffic"
  homepage "https://akev.dev"
  license "AGPL-3.0-or-later"

  on_macos do
    url "https://github.com/akevdev/akev/releases/download/v0.1.1/akev-0.1.1-universal-apple-darwin.tar.gz"
    sha256 "198bf7e945296f61c37ed2d5a87e6a5024a964edad097eeb6d2e10bde1a61de9"
  end

  on_linux do
    on_intel do
      url "https://github.com/akevdev/akev/releases/download/v0.1.1/akev-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4849b23ace8d5f027770b93f51859c45bbf4299f28a8036175753f5aca7a88ec"
    end
    on_arm do
      url "https://github.com/akevdev/akev/releases/download/v0.1.1/akev-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86575afbf99a0c342fd17424adadc2abcb0e01b6b73febf14800bbe32cbd1d43"
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
