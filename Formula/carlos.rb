class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.24.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.2/carlos-darwin-arm64"
      sha256 "130d467b8aaadd63d2a8096ee08220a6ea94c517a52d274a535d04e8aca6c34a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.2/carlos-darwin-amd64"
      sha256 "bee5249007c98fa71a24ce2d79b4dd4dae68e84fc66a17312eb7c37168f7bb21"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.2/carlos-linux-arm64"
      sha256 "bc53cfc55018674b7d16b4b1717f12f4d807637c5d4f104c9889004ed5f4a0d4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.2/carlos-linux-amd64"
      sha256 "b9b33d50b357033ebd0523e01b83ec8aac803f4fe8c9174e7df4ebfec87d0e7b"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.24.2", shell_output("#{bin}/carlos version")
  end
end
