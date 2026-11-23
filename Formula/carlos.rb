class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.1/carlos-darwin-arm64"
      sha256 "2202ae1cdf17c758e827fc72ed1bbea3392b3d525d5de203f0cdd8cbbddc025a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.1/carlos-darwin-amd64"
      sha256 "80f2dc50f534c1b2328991d7844c1cbac1646be3a92ab2408da52d69009c6dd2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.1/carlos-linux-arm64"
      sha256 "bc49e30297bc41f62be701c19357a7d3d2c193f4984766192e94c185475decc0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.1/carlos-linux-amd64"
      sha256 "7588b96b337778d2a074d943437a5a5c661368ed608bced34f0d9f84eab09d3f"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.1", shell_output("#{bin}/carlos version")
  end
end
