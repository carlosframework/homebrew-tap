class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.30.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.1/carlos-darwin-arm64"
      sha256 "95ac8aa9f9a83412fd8ba1853344ee61d7b11b5a1ee5f01bc9e626fab4adda02"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.1/carlos-darwin-amd64"
      sha256 "0a84732b9015dc248b4779ee90d9bf88646afcacbec032fd3fb23e7c6d6c187a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.1/carlos-linux-arm64"
      sha256 "c45a3ed885b8a086e1141a69e8b149cc2436b365e9cd9190803aab2e4ede55b2"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.1/carlos-linux-amd64"
      sha256 "30af2e97cf2ee68e674556af6ca9eec8297dec84d05027c25cb44274631e2c6a"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.30.1", shell_output("#{bin}/carlos version")
  end
end
