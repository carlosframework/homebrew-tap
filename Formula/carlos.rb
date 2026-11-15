class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.36.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.0/carlos-darwin-arm64"
      sha256 "a89e5467de48519f81a69c4f6cf118dad3ad755ada208a46fb91d5f5796931a9"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.0/carlos-darwin-amd64"
      sha256 "1cdb1f401a05e182cd1d192aceda110c5f5ec46cf6c12181a0b970a0868bae26"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.0/carlos-linux-arm64"
      sha256 "297107951313984e5fd70f1b0d9b2a47bbea62029ff5bf452d7cabbedd89760d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.0/carlos-linux-amd64"
      sha256 "0b2043f355c05c4f399995997feda3b2631f7be4fb7e1b3d735d26f0f2cf6ba8"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.36.0", shell_output("#{bin}/carlos version")
  end
end
