class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.14"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.14/carlos-darwin-arm64"
      sha256 "ed50ec8c0acfe1758ddc12029a145ff96cf33bc342e7cb4afed4f56721a4fa50"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.14/carlos-darwin-amd64"
      sha256 "36a3b8e697f33344fb1e0ba3de8c397071e4eff630a68b3683b02ca8e5b07c8c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.14/carlos-linux-arm64"
      sha256 "03064b158c1116d7796ac61f3a619a17d88bb26ecdb90abdef1d0791ca648017"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.14/carlos-linux-amd64"
      sha256 "4bd344b19a190beffd889a25fc34313fb0a3067f21b729e12f0d12fd1bf87085"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.14", shell_output("#{bin}/carlos version")
  end
end
