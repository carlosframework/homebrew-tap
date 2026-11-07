class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.23"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.23/carlos-darwin-arm64"
      sha256 "e9ae21d93cb62b717d5c5d26420cb6a34e666458645364f4e6fe2cda59307ce1"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.23/carlos-darwin-amd64"
      sha256 "7d18b4a308cfb69903f24f55b70c166107967972d22b77f9f32ecc007ca99f82"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.23/carlos-linux-arm64"
      sha256 "8854f6c5fc5b5c3840d28cba0047adfa5a84ea4f164f7b9e1b1a321e4e7b4f97"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.23/carlos-linux-amd64"
      sha256 "2f56818720cd1e10c3254013b6e7a4658b4b97c17628b10be40b279a0fe618dd"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.23", shell_output("#{bin}/carlos version")
  end
end
