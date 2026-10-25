class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.16"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.16/carlos-darwin-arm64"
      sha256 "7e25c544caea61398b5ec86e4cb047049eb1135d5ec56484f54694f57ba18780"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.16/carlos-darwin-amd64"
      sha256 "606488d942de1573813a0964803ca27f3fc621e529c849241762f67501faaedd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.16/carlos-linux-arm64"
      sha256 "578bab0f7647a56fabb390b2c77dd51806293d6ab1228e5fa24aa61c7df5d553"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.16/carlos-linux-amd64"
      sha256 "ddad8ac17cdbe9d0e4b208bf25a01c636076c1a71829082ae50abb4e0313b366"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.16", shell_output("#{bin}/carlos version")
  end
end
