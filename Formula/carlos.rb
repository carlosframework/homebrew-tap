class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.21.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.21.0/carlos-darwin-arm64"
      sha256 "60d8cf4dde3bc390626a003b345016d47004908aa5f699d4f49d7a7d5400a805"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.21.0/carlos-darwin-amd64"
      sha256 "1a393a12f000ca38a62877b6091b912a309669c4aade06b335a06948661dddd8"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.21.0/carlos-linux-arm64"
      sha256 "0a33ba092c011a9c44e64acc1f600a82aae74780e3a98db65f2ee83d88eebcc0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.21.0/carlos-linux-amd64"
      sha256 "2adff24fd5158b5a23a1dfb67f876dd8e81ebb1c767b1e8d35ee027f47aa53d2"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.21.0", shell_output("#{bin}/carlos version")
  end
end
