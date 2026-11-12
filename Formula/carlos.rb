class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.49"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.49/carlos-darwin-arm64"
      sha256 "727025ae8f37f241a195162d43adbd4e3c1115c14ed20fb34490084ba658ef47"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.49/carlos-darwin-amd64"
      sha256 "7fadf648579287e17e3031921293d098b3d2d8ee57f8856c0a3ca84bb1cc2400"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.49/carlos-linux-arm64"
      sha256 "6145f6a0247b4c91880473d071cd599969119093af7d8c6b069db3c9c7eb74b2"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.49/carlos-linux-amd64"
      sha256 "5b3f372b0d7812c87d3a2a2c6e801aad810ea781dfb8f1e98f93f40f5a86cd12"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.49", shell_output("#{bin}/carlos version")
  end
end
