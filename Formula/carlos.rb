class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.45"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.45/carlos-darwin-arm64"
      sha256 "e062d0ba51c58a14b9d90e9010630e2b23e0a02a241e52bf683afba8ebf51557"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.45/carlos-darwin-amd64"
      sha256 "16091f2bda89fb046c1f7075eb2b35fce9203839edb76542c61e02b4a845f5c0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.45/carlos-linux-arm64"
      sha256 "df267660e106d2ad8768815930563c7316637bb8b401c97bef65cd43e458e247"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.45/carlos-linux-amd64"
      sha256 "11cb5b7c802fc26dc70b3c5c60a3d964dd0e53f190f1e329c70a4ede12452364"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.45", shell_output("#{bin}/carlos version")
  end
end
