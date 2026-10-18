class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.3"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.3/carlos-darwin-arm64"
      sha256 "d5360eacc4fd831f7db3a536c740069171f86afa77dc4a738afbc559f66bd689"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.3/carlos-darwin-amd64"
      sha256 "41f4a433f37b578b9c989662e41d00a47630f69d579f1259a5bfc8adb252c178"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.3/carlos-linux-arm64"
      sha256 "6154afb458a35183e470f5480ea08c09817400e6e67465530477e5204af2def0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.3/carlos-linux-amd64"
      sha256 "82a60203b1790771b5f3da16bc5d342327131ed30a1aae59a520f42d253369b2"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.3", shell_output("#{bin}/carlos version")
  end
end
