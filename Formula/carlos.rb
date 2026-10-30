class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.32.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.0/carlos-darwin-arm64"
      sha256 "24d7d6832e7a02d3aada5de3c9c39e48508007074d709a47b6244e02c2d716c8"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.0/carlos-darwin-amd64"
      sha256 "735c97c0dc51b2af7f30183b93f4d1e0222007765f81e635a6948c2918902fd2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.0/carlos-linux-arm64"
      sha256 "dd257436603d00eb0ff25591f256dfcf3126088540650968a4908d290eb2feff"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.0/carlos-linux-amd64"
      sha256 "23021f735b13b68f9b7dc0359fccdcbfd96d5b58f9017414c41a9ea8cd307871"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.32.0", shell_output("#{bin}/carlos version")
  end
end
