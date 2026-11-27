class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.11"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.11/carlos-darwin-arm64"
      sha256 "cfc4fbac623dabc23600a77b94af55623034574c28876f3fdb096146b52f5fc3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.11/carlos-darwin-amd64"
      sha256 "62bba2cb11bd9e25e1b2b0101d70eb1d31fcfd6561f856a53725e8709d713b61"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.11/carlos-linux-arm64"
      sha256 "9bfaf552450391d17027d121dc005301ca1d739611451226494e8316b5d46e50"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.11/carlos-linux-amd64"
      sha256 "b15579a3be63121736f597b34efaee507fd4566bca9e36c1c5705ec7a97c57f3"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.11", shell_output("#{bin}/carlos version")
  end
end
