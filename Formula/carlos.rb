class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.15.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.15.0/carlos-darwin-arm64"
      sha256 "efd0bf1f66c9664daf4a754d6664511ccd51ad16697cfd48cf3533dec8291b68"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.15.0/carlos-darwin-amd64"
      sha256 "b3e3a0d1e1488a0c47133e8a5e461d9a8df9eac6bc569728dca431bf2271c314"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.15.0/carlos-linux-arm64"
      sha256 "7c357e83d1c0164503ff16607f26e0495133db40014fd0b2c714ad4d5f7068da"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.15.0/carlos-linux-amd64"
      sha256 "d3ba4ab6c78bb62d34799d2816b5f230edb50cee7fd0f4ce11a996ac543feaac"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.15.0", shell_output("#{bin}/carlos version")
  end
end
