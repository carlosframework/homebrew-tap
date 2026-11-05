class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.7"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.7/carlos-darwin-arm64"
      sha256 "605e0f442fb7966c1989ac092dfcd29ab88330d37187820d5d8a4a242f0bde46"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.7/carlos-darwin-amd64"
      sha256 "d1700f9c6032ea67f81dbb99e404f376d1ee8f63e322859f2601aec2d1b0540a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.7/carlos-linux-arm64"
      sha256 "38b0423cfac41e9b074e20bb4e87e98be881a2de83622bf51fc51d0d0e7a0419"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.7/carlos-linux-amd64"
      sha256 "8edbf0c6cd6e7b4a9f6c5a986afa956a78e7a00ac4309652fa9b4de07543c5f1"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.7", shell_output("#{bin}/carlos version")
  end
end
