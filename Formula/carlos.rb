class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.3"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.3/carlos-darwin-arm64"
      sha256 "f6ed09fe2c992b638c4fa1bfbbfeadfb3d3f6775032322073d88be2b6acdba0a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.3/carlos-darwin-amd64"
      sha256 "391333796c1f513943a005e3b36d2dc1777b8e4234495ab9d4d5bae977f4c839"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.3/carlos-linux-arm64"
      sha256 "b0f76a714d6e45a6c48ffb1df65ec133499829f333dd5c82cce2c613b8c79749"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.3/carlos-linux-amd64"
      sha256 "0f54dcec3abad40785c9a2442222e5a6faac3444666871fe20b08eb7b0f0f737"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.3", shell_output("#{bin}/carlos version")
  end
end
