class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.22.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.22.2/carlos-darwin-arm64"
      sha256 "adfadd51859bdf18292f8d51173cc971128f789aa639f4d4eef42b69420f2c23"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.22.2/carlos-darwin-amd64"
      sha256 "89f12f14336106919d5a83ac017dd8971f12c2cee48f764a8a857707b7eb4247"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.22.2/carlos-linux-arm64"
      sha256 "37d7ae0e609a11e80eabfe8fb12186145d43a1ecd591031a6dd028b5303c447d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.22.2/carlos-linux-amd64"
      sha256 "ad2107b874f7704a090b9599f4f961c141552d7c8c4307c6a524e356b7b570dd"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.22.2", shell_output("#{bin}/carlos version")
  end
end
