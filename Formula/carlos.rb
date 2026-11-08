class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.27"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.27/carlos-darwin-arm64"
      sha256 "01d2e39d2690ee0b8ed83087cee04e8c4b65e3a6a3179d892df4f48451dabdec"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.27/carlos-darwin-amd64"
      sha256 "35dec6b061dd86a275710ee7aa4cc904ab4956f6adc2448fb727d1ddda37281a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.27/carlos-linux-arm64"
      sha256 "f93fce51e8d1dbe1409e3a181cdd8257b9b77b9a1622feace2526ec13a8fd15b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.27/carlos-linux-amd64"
      sha256 "957842e56b886de216dd696e0da64332a6c0e41c8adee52f09cdbee3adb0e19f"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.27", shell_output("#{bin}/carlos version")
  end
end
