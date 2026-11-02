class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.7"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.7/carlos-darwin-arm64"
      sha256 "519304f425b9d6d1a9c1ee0ca81483efcd6eeab154934f0edf6e44ac6b9c7dee"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.7/carlos-darwin-amd64"
      sha256 "433a40f7c97c18cfd5775d1685cfd6848050b343fe4aa46bb63ed95cc5bb6652"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.7/carlos-linux-arm64"
      sha256 "9c1812609e219a1a0584d34d71289de51e8e80ebfad30055f7ee8cf975c1dc15"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.7/carlos-linux-amd64"
      sha256 "1a3fb4ed39dd8e8184c5c6b5bccce7b56fd887c31f3027fed1a32d97efaebc9d"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.7", shell_output("#{bin}/carlos version")
  end
end
