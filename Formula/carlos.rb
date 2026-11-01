class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.2/carlos-darwin-arm64"
      sha256 "766c86959fa26191adbf334cb02a75b2f5d4a7a0ddc267d949e0128d2f5fb6a4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.2/carlos-darwin-amd64"
      sha256 "c4f9e8dd81e3fb0103b466f5da4c26f2c797558b1cca10424aaab9bd8528a3b2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.2/carlos-linux-arm64"
      sha256 "db803c416f429afa9ff26fa6d6fcfabbdf9a7c3c3c5addc791868731397ab532"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.2/carlos-linux-amd64"
      sha256 "2666a4939e08449a0c1070b38e7d358a8265f301465ff78de887ff2a540a2870"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.2", shell_output("#{bin}/carlos version")
  end
end
