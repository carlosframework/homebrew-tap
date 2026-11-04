class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.1/carlos-darwin-arm64"
      sha256 "6f03363bb81164f926be3b40c467a9fdde8d939e3828dc3c85b2f9ceffa901a0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.1/carlos-darwin-amd64"
      sha256 "ce58d703c5f42f580a74e071497f58450a96bd7eec6cb2dffd21195b98daa03f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.1/carlos-linux-arm64"
      sha256 "6acf0cd95a4f25d8cb4ba9f8259b95ab101212a4f0fc180a68f3f7ac5b6e457d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.1/carlos-linux-amd64"
      sha256 "8846936eea062750624823073285744f2f184c18086fb5cde325f9580d089397"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.1", shell_output("#{bin}/carlos version")
  end
end
