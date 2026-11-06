class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.11"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.11/carlos-darwin-arm64"
      sha256 "cc02d7ed86ebd5968c5c85943780d2f80730f309d7f5d322954ad9b7fbdac5e8"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.11/carlos-darwin-amd64"
      sha256 "f6cb36bbd6864de5b79fd90005ab039d812346a4f720cea8322417322900f416"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.11/carlos-linux-arm64"
      sha256 "37f780e19830eb027990cd0717a4c878b9e9de7879ef2a12ab272e6cf8329f9d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.11/carlos-linux-amd64"
      sha256 "0fd4858f9a4a69c15e705434197a2a7f035b3a074925dab5aef9cd91222ee6ad"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.11", shell_output("#{bin}/carlos version")
  end
end
