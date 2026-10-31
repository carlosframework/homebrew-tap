class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.32.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.2/carlos-darwin-arm64"
      sha256 "0c4e1abf91fe2476a6d927e98de3d53ec043d4aeb075b4b51c67fae19933a4b0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.2/carlos-darwin-amd64"
      sha256 "fd1160054cf7599c6e33ba3ee77a560b7629a29a7b83a57a0523b3699e14f2ca"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.2/carlos-linux-arm64"
      sha256 "7ff82c47f92a3515e6b20eaa9b298fae1ad0bfff322471212d7f3d875ef177fa"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.2/carlos-linux-amd64"
      sha256 "cd3e6af68d18f3889d5be1d34cc3af0142bfbc652792315cfd42a1ff717be033"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.32.2", shell_output("#{bin}/carlos version")
  end
end
