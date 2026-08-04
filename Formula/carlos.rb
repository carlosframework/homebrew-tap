class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.4.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.4.0/carlos-darwin-arm64"
      sha256 "94245c987eb979d2f126a3851456e5d54026d45bce7ecfa14dccc819e7e34e4b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.4.0/carlos-darwin-amd64"
      sha256 "1167fab4c4f96b06ea32e9cb4a67b0fc93a776a6b0513d462caddfd5dcc14785"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.4.0/carlos-linux-arm64"
      sha256 "5b271ce632e95544d6424e39b887f8194df892981d3ce782ad02c227fb7e15cb"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.4.0/carlos-linux-amd64"
      sha256 "75538771624b89597b7911d5c9ddaa3722984716a35011c7852615b8bafd50df"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.4.0", shell_output("#{bin}/carlos version")
  end
end
