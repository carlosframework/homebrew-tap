class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.19"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.19/carlos-darwin-arm64"
      sha256 "b13786c90480ec3a76e1df7a5cd6aaf11a2c030d697272aeed51c414fc777ad1"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.19/carlos-darwin-amd64"
      sha256 "297d566f29f0e26ad2e449cbc0664f8842f28025007e69102b8078e4494aa020"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.19/carlos-linux-arm64"
      sha256 "6d33d2f7817d7251b758dd47781f37079b3d2a2eb50fc931ffa08a58ae4dc65d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.19/carlos-linux-amd64"
      sha256 "d61fbfdafd32f4c185124fc4a0c4bcadf9c38425809fe88cbbb3c226dc456e94"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.19", shell_output("#{bin}/carlos version")
  end
end
