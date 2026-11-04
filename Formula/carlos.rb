class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.2/carlos-darwin-arm64"
      sha256 "7b36fa071000b5004c7b632f7fd815dddb7895cf8405fc955a5bec0b103433a2"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.2/carlos-darwin-amd64"
      sha256 "6455c0972e7a7d3017e414a58e8fdd1e9f75fe72ec96fd29e54d67741217810d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.2/carlos-linux-arm64"
      sha256 "f837b3763457825d469c89cde80fb85fd45f50fd1872a8d53147d53fdebfdc01"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.2/carlos-linux-amd64"
      sha256 "b8bd45fa57638e5299b6f016ff3880235ef185ff10311db61a99b35790a85ec5"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.2", shell_output("#{bin}/carlos version")
  end
end
