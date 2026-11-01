class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.4"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.4/carlos-darwin-arm64"
      sha256 "a70491285061c0b26081db646f1dc50c83e6e5159d0a3e761504767414dab581"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.4/carlos-darwin-amd64"
      sha256 "a6cf8974d82077d9b7f1ed61640c281ed64c077cef7f38d5c7429f31362b753e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.4/carlos-linux-arm64"
      sha256 "86b1952b7a94ad2ab715cc38c484512110f2aa551613d9834b9909ad5d0c5d49"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.4/carlos-linux-amd64"
      sha256 "cbd6340001cc326b61ed5b13a85e5ad961f522fc131f487e9b1aa11736ee0872"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.4", shell_output("#{bin}/carlos version")
  end
end
