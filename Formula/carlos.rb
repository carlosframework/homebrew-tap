class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.36.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.2/carlos-darwin-arm64"
      sha256 "2b1cdb1df6a0b374ae9d8b6541514de789189f8a45503859984209486e17ae30"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.2/carlos-darwin-amd64"
      sha256 "59690a4b22558ce53b3fc1d62bdb1db7982c926f1b2794e940f7610b2bc424a6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.2/carlos-linux-arm64"
      sha256 "b7482ffb90d0436296af4f7a58dc7bb0396e208d34602f4a33246155608905f3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.2/carlos-linux-amd64"
      sha256 "19ab00ee918ab16bf1f3efd5bf2306d052a688d589f67e69cf7f70ecac8520d9"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.36.2", shell_output("#{bin}/carlos version")
  end
end
