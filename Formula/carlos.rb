class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.30.3"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.3/carlos-darwin-arm64"
      sha256 "fac2781ca1e614b600065300310faad5a3942a396e983733a48dfa94359fad92"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.3/carlos-darwin-amd64"
      sha256 "b834fd9d74a593a6e651c12738d6b0e6082c7801ca4222b7379d96d0ac9a5935"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.3/carlos-linux-arm64"
      sha256 "68b2b45ec1ed8401b697d906a103d25ddc44a43987aa048495f04cc6ee4baf31"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.3/carlos-linux-amd64"
      sha256 "55b4893b21dfcf20514aca4f50bcbe61421539c60c25d06265d03cc531a6fd40"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.30.3", shell_output("#{bin}/carlos version")
  end
end
