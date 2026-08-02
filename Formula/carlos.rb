class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.1.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.1.0/carlos-darwin-arm64"
      sha256 "4d1d3a232b4eee5c7869b439e48eba85966371333cbba1d759c64317ec4ff310"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.1.0/carlos-darwin-amd64"
      sha256 "63e4e9a01c85133294f4a46dd4d3d3b2e35a38ab2d6917d649ed720708377d35"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.1.0/carlos-linux-arm64"
      sha256 "10450cc96e50f5bbd207f56fe84537d6d7d7017af06ee689f408fbc66e8017a6"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.1.0/carlos-linux-amd64"
      sha256 "99f2ee629b65ba873b23ca0019344781cc1323675f7fcf4bae36a025707c9b22"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.1.0", shell_output("#{bin}/carlos version")
  end
end
