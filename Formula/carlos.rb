class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.39.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.39.1/carlos-darwin-arm64"
      sha256 "7815a693a67e0d35492c1d3f34b1df2910214446c029484111771f2dce840202"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.39.1/carlos-darwin-amd64"
      sha256 "2e11d90b84827b5a28a1b6b786e66e9ea269d0d8bc0992bdd9ea20c77ef353e1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.39.1/carlos-linux-arm64"
      sha256 "475ad571678f6e6de9a3e41ecbb0e248cac01a2dbd683699a29f14eb62485eed"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.39.1/carlos-linux-amd64"
      sha256 "7822236aca4ebaa5ecd86e236d38bf60ea8a375725db819110f18067eb17534f"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.39.1", shell_output("#{bin}/carlos version")
  end
end
