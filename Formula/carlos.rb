class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.16"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.16/carlos-darwin-arm64"
      sha256 "e498aad2fb138d1ef19ad374071e22cce970d41868b7f716eeb5ac8cfc544f3d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.16/carlos-darwin-amd64"
      sha256 "232115daa146a1a89449966e9c850e0344b6788c0d3fa3fbfbb2559686535304"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.16/carlos-linux-arm64"
      sha256 "a7886dd133a6e975b1ceefc1484cab9cc8f2d4b87a7bfa20de3f8e255b961ee7"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.16/carlos-linux-amd64"
      sha256 "c9a31c098330b3d7dc90d853f53c7a5544500f1814a794d18b66fe424b60b5ba"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.16", shell_output("#{bin}/carlos version")
  end
end
