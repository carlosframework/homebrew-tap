class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.23.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.23.0/carlos-darwin-arm64"
      sha256 "dab21b8ff76a4f10c68c1244e59be60655950290d78e74aa9c955242de382c4b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.23.0/carlos-darwin-amd64"
      sha256 "4cf1c039df08c4d0109b5c61c32100e5d9f40467308418b8af3d438e3c329d1f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.23.0/carlos-linux-arm64"
      sha256 "c72865bdb1d115684b354d8e7ccc0f6f8b622ccfaadf4ac52f014fbbf13b886d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.23.0/carlos-linux-amd64"
      sha256 "d5d050ebfeaf256462f6e07c8f53aadf1774049293c0e66ae195c217c51f997f"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.23.0", shell_output("#{bin}/carlos version")
  end
end
