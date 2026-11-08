class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.30"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.30/carlos-darwin-arm64"
      sha256 "b88df73bf66f2828c914d2606cd18d908454e2d9aa40e533c8bb07d7dd8895d3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.30/carlos-darwin-amd64"
      sha256 "2b6afae57abc1b111f6b953a19f8a8c8ee56416986042d23747a78746aaa00c7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.30/carlos-linux-arm64"
      sha256 "cd3ae65c0dbbf8b2d8c5b3f9747b651f33480ee213989d78a7a0eb61ad178fce"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.30/carlos-linux-amd64"
      sha256 "82f28ddf0b6d18c8619240ec6381434f92d60f2cb0b78ba5e65814752239e88f"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.30", shell_output("#{bin}/carlos version")
  end
end
