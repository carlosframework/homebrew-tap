class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.22.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.22.0/carlos-darwin-arm64"
      sha256 "20dc349095ea37432e12784850b7953ab2fe80e50888844f1f2fc0a11470e306"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.22.0/carlos-darwin-amd64"
      sha256 "6ad35408995a2bdb0c8fac9c18e81b3d16b47c3f1edb99f1280b5bd30c1e366d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.22.0/carlos-linux-arm64"
      sha256 "567a9af63541207ce9b79e56a8be137df7f2b4a6d930ee77b7b6a9f4ba1a7936"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.22.0/carlos-linux-amd64"
      sha256 "e1511980a31e963ef915829b0c9e91960a6632f5ba016da041c07db47104b85c"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.22.0", shell_output("#{bin}/carlos version")
  end
end
