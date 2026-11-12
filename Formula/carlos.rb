class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.48"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.48/carlos-darwin-arm64"
      sha256 "568db6b70dd10e403fe6a3ea74c9ffe724caac5fd75796a965044c867d600ceb"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.48/carlos-darwin-amd64"
      sha256 "ca63ab06b7d8ebbd369a123babaa48c4d149a5ddf0dd4bcf8b8360934e85e485"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.48/carlos-linux-arm64"
      sha256 "50b20443f95c00b3f21ac7003fa6374ebc44352bde412ffb1348a15d2d09e93e"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.48/carlos-linux-amd64"
      sha256 "652c837be8caaa5e39d7ece554d3fafe1ec79a0e22422c4dec8f499807309b4e"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.48", shell_output("#{bin}/carlos version")
  end
end
