class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.35.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.2/carlos-darwin-arm64"
      sha256 "e4555009770d473892f88352331436eb86c9ebc9cf31e96acbc3f181cf163bcc"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.2/carlos-darwin-amd64"
      sha256 "0363ef50709da69a5541636b01969d591770b9dca2aa90d6c7a63a386315e2fa"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.2/carlos-linux-arm64"
      sha256 "7f5050ebd99f829b6c9efdbbdc3a1511adacd4fe964959ad9263c6fb792ab1b0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.2/carlos-linux-amd64"
      sha256 "afa41c0f4b613af76c029f075f41aaaf56e7678e4b12b9efb8412cd38f2e286a"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.35.2", shell_output("#{bin}/carlos version")
  end
end
