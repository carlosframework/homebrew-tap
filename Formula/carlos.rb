class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.37.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.37.0/carlos-darwin-arm64"
      sha256 "7d142b40d5fad957899f6a3540e7474aee4a5eef291c4174479de6d6b8234658"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.37.0/carlos-darwin-amd64"
      sha256 "1aabf53c1b1f3c211b6e0ee86c720aed1d7918f2925505db2856f205cb127f2a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.37.0/carlos-linux-arm64"
      sha256 "1b6dca96f2064b794eadfaea13fbb93ef3755f0a304cfc46ef09e14fc3a37b37"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.37.0/carlos-linux-amd64"
      sha256 "d00d24fbf04ce01d6339c6110a90e90f2d7bf8b8fbaa69661cae3a1065fb9fc9"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.37.0", shell_output("#{bin}/carlos version")
  end
end
