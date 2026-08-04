class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.3.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.3.0/carlos-darwin-arm64"
      sha256 "61b3ffb794d6e2ef9112614bb35f73682553f03d21f7959b4ddc4e84dd25b7c4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.3.0/carlos-darwin-amd64"
      sha256 "78b91c24b4ee816af6c8a582ac9c45f52f80851e19cc3c6bd73573eaeee664a7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.3.0/carlos-linux-arm64"
      sha256 "ee7dd7ea58da7724c898545f36819514912469757e1f8f01a0802a7e0c4f606a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.3.0/carlos-linux-amd64"
      sha256 "72340198b30d7b4107d9e648a8575d30ba3942a7608cedc9a234368d20a1a164"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.3.0", shell_output("#{bin}/carlos version")
  end
end
