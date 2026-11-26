class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.9"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.9/carlos-darwin-arm64"
      sha256 "79565c3dc5d1f5b7fe4d8f74fc8b5a02689dd57627b7df25066c1bca24f9e131"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.9/carlos-darwin-amd64"
      sha256 "7c4456eb648c6d007daf6a2425baca5b6816ef080bb87b77fe1e28350d4a4e24"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.9/carlos-linux-arm64"
      sha256 "3b323234e5e302ef32453637359f8b8a6b68431cff8e8c0489cef621371956e1"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.9/carlos-linux-amd64"
      sha256 "edb03fd30b243e877e6fa2cc6056a83403a2e64a31c5daf4b04e840a8a5bfb99"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.9", shell_output("#{bin}/carlos version")
  end
end
