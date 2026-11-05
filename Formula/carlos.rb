class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.4"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.4/carlos-darwin-arm64"
      sha256 "1d09353e185d7f5f3ba0061f43a2e41de1fa5885b349b598a591bf74d25f6100"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.4/carlos-darwin-amd64"
      sha256 "438a12a1c3f7067b43de100b63351f9d7abf716b287873c8398684e196a83338"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.4/carlos-linux-arm64"
      sha256 "ca8e1e6d0f97e0d2911f2ed7e718d7bb84e76d1c87a09e6affa7bb566701d28a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.4/carlos-linux-amd64"
      sha256 "3805e45e382725bcf8a91a27044e1db874c8eb2fd3a9a15825f427fa1d9fc180"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.4", shell_output("#{bin}/carlos version")
  end
end
