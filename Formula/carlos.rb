class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.37"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.37/carlos-darwin-arm64"
      sha256 "6207e52d374e5310af496eac3b7be9086f34e11c445896ce12f9cf89c4c7a70e"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.37/carlos-darwin-amd64"
      sha256 "298c00d6b1ca079a4936d8a290b7ab0c574b674c04c853cc592a88f199fead8f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.37/carlos-linux-arm64"
      sha256 "514dcfbb68c0ffecf62f6744ba3b4b5a377c4cd1f512e80d4a86cc640fbcb134"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.37/carlos-linux-amd64"
      sha256 "166c098d00446fa4a6704353ac29e2e61b98c2be14f5e37c527ea16765b2250d"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.37", shell_output("#{bin}/carlos version")
  end
end
