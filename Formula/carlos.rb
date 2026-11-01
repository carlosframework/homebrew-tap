class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.1/carlos-darwin-arm64"
      sha256 "a0a555902b1bacd3421921864202523f8e622c3798d5de508feadb497842e9f8"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.1/carlos-darwin-amd64"
      sha256 "ef1d047da1c674c30303492a17fd5d9a09fd58fb918336cc1e4b25930c077c68"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.1/carlos-linux-arm64"
      sha256 "300903f55daa693d59aef74c1abd109e5f87b9aff5c5144d0188cf65717a56ad"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.1/carlos-linux-amd64"
      sha256 "96c3a9b66c2abc88d5dcf6519658fcc3d812bc374067137ce313a28a5f236a55"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.1", shell_output("#{bin}/carlos version")
  end
end
