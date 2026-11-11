class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.46"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.46/carlos-darwin-arm64"
      sha256 "dd1012371a8b3633942ff0368b7fa1f0ea9331c225f4390eb7223262c01abfa4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.46/carlos-darwin-amd64"
      sha256 "067a372719915b0245eda51d2b6b8fad911d0c6916e116044e1fca40db763e1c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.46/carlos-linux-arm64"
      sha256 "edd29d30ad05fc46109d046156a0fba757bb06cf271623e6716c789a35ed53e3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.46/carlos-linux-amd64"
      sha256 "033f060a1606c2e41dc6f7939e5e6c1a9f6f5d812fbf4fd63cf499b2b182c4e1"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.46", shell_output("#{bin}/carlos version")
  end
end
