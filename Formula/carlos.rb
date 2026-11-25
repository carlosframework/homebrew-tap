class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.7"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.7/carlos-darwin-arm64"
      sha256 "5b1c509b2768ff6a33ae7a1b009c6ddc621d5fbabc67e5acf2ae4d98e74bd18c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.7/carlos-darwin-amd64"
      sha256 "df3ae2af0c948807aa99f00b92ccbd960c4383ec6af64338362d3e16c85835c1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.7/carlos-linux-arm64"
      sha256 "ed04544073a6c15de010336a79deaab0574c61de9a423e286b50040e63033d0a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.7/carlos-linux-amd64"
      sha256 "d856d840ce8ed40c9811e56c3d358dad60b5b1b4b3b11591801371a0a21da3f8"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.7", shell_output("#{bin}/carlos version")
  end
end
