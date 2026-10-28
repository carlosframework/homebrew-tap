class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.30.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.2/carlos-darwin-arm64"
      sha256 "26850cc77ecc2fa3d3f1bc99654671e6f933b12f95ee3ce60b352aa1f4cec973"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.2/carlos-darwin-amd64"
      sha256 "78623f5e054ee4ef61d7a481a0cec31d290c9e87bf7922201b5cac185d635a10"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.2/carlos-linux-arm64"
      sha256 "c040806b2bd299a61814dab435f42d72037f89ede1ec813ecb4f8402d8d02979"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.2/carlos-linux-amd64"
      sha256 "0da14e17e7e212f79ceec86f17a4734b5823895e79afc401d00ee1986129feb9"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.30.2", shell_output("#{bin}/carlos version")
  end
end
