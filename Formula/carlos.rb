class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.25.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.25.1/carlos-darwin-arm64"
      sha256 "cd6274af38e23a1587ef8de572cb58fb47d8cd143cb267c64b2f6a8c5341289d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.25.1/carlos-darwin-amd64"
      sha256 "2b4de884922f544a4b20444c4116eb11bade8a536768042accfcc8be3d62e4c2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.25.1/carlos-linux-arm64"
      sha256 "fc5d8b41f57254f41e2c0b4227d4bc9aec5ff63022f7f1333d0084b3c24e982f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.25.1/carlos-linux-amd64"
      sha256 "34d0d582f58c9eb5fc68237716d254d47a5029f4368d7c926cd0debcbecada19"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.25.1", shell_output("#{bin}/carlos version")
  end
end
