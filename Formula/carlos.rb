class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.27.3"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.3/carlos-darwin-arm64"
      sha256 "f49b39242aa8f935f30d9ec2a2cd9d4b76c7517b628be6ac5edbf5620f249316"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.3/carlos-darwin-amd64"
      sha256 "cb2f8a3baef8e6f3c5ae6b8aca189a83ffcf31469a39b4db207b80a1df1df34b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.3/carlos-linux-arm64"
      sha256 "cee6952d8beebb9f469aeb26434cc105eb31d60200d80b089b101449dc2bcbef"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.3/carlos-linux-amd64"
      sha256 "d44113ce05955be8a7cca00527446e5517e1196c31c76c78c6d2bdbb38afb720"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.27.3", shell_output("#{bin}/carlos version")
  end
end
