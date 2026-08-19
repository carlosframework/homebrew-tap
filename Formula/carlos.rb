class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.10.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.10.0/carlos-darwin-arm64"
      sha256 "2aa615ec334d06c49c4138e1d1f69ad8bab39cbacaf6bab1e462a9ab1a45d837"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.10.0/carlos-darwin-amd64"
      sha256 "f5424581af15398a85a29a56ade49e06978a1b76c4e65f66ac0f8a1a47c66f90"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.10.0/carlos-linux-arm64"
      sha256 "4d12c5b44598914c128ad8ab9229593aef0ac73bd2baf0099523871de7ca6476"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.10.0/carlos-linux-amd64"
      sha256 "9829554a31e839c1d40095d7cf2aa9696d86384db64077bd51b013e98497595b"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.10.0", shell_output("#{bin}/carlos version")
  end
end
