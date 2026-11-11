class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.44"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.44/carlos-darwin-arm64"
      sha256 "888ebe7b6afcea47efc459f278c4e128e6792ecb158fa26fb7a154225df0db08"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.44/carlos-darwin-amd64"
      sha256 "91e500c68c38cb61af52f28c7dc9860babdaa2935d2965ad4c69aa4ffb94ad9e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.44/carlos-linux-arm64"
      sha256 "ce514c9cebd4d707c582edc44f8e9d4b53f1962dde6a1e9f732563011433e827"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.44/carlos-linux-amd64"
      sha256 "72c90d601eb5b5a0af1bdca3f8ba4626db76e2296bdbabfdd3eb4d31801a430d"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.44", shell_output("#{bin}/carlos version")
  end
end
