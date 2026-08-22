class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.11.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.11.0/carlos-darwin-arm64"
      sha256 "5d4e2c1992370e5e3189fd0ff04db192120a64f958e00169458bac83554f07c3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.11.0/carlos-darwin-amd64"
      sha256 "1d6d40667e12a54f3aa4bcb2bd4c04971b85755975d038c63744372805217136"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.11.0/carlos-linux-arm64"
      sha256 "9a325179f593601933702f0db9a1b32ff86a2328ba39ccc464dea7b6d146ddcb"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.11.0/carlos-linux-amd64"
      sha256 "e9aabf6b3c3d8175c089c35cda361f4a751caf624241fd45f25440d5d7b0b74c"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.11.0", shell_output("#{bin}/carlos version")
  end
end
