class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.26"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.26/carlos-darwin-arm64"
      sha256 "379dc8c4912024d65607b1312d9e1f19498feb6250e930aba90c729c55379ccc"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.26/carlos-darwin-amd64"
      sha256 "0a430a86c32aeee47302378a37c4db90324a947397f61015a1400f5704182e9d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.26/carlos-linux-arm64"
      sha256 "bdc4694ad9c3e1b754de5da39d63800e7b4db172ba94619dcb43405d61e5467c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.26/carlos-linux-amd64"
      sha256 "1fbe2434be2aab4d1e38f7aa83a4f86e305b32b048dbdc2eab7d353b54bf0288"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.26", shell_output("#{bin}/carlos version")
  end
end
