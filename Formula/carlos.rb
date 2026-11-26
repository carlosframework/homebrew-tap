class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.10"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.10/carlos-darwin-arm64"
      sha256 "0d84c6df29098a4fa17da4d78193fbb6fad3e8dfe28c2aa7a11c1e03c49c9835"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.10/carlos-darwin-amd64"
      sha256 "c9ed5bb11be9bd0d47f7d4e64ea1e9dcde147923b5d98acd156ca4afd6ba08ee"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.10/carlos-linux-arm64"
      sha256 "3ea3f457a1eae91b7c3b3cbd289ac4ae077ce20dd0c5d631a599c13f341f188b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.10/carlos-linux-amd64"
      sha256 "aa8f0b0f4b96b29ec4acf39e74e6f42616cc3a00b4dfe24114e1b31024f025d0"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.10", shell_output("#{bin}/carlos version")
  end
end
