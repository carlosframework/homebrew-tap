class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.15"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.15/carlos-darwin-arm64"
      sha256 "aa664b917f3c15f76c66ab02c773aab005037dfa5f3eb032702178628f0003f8"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.15/carlos-darwin-amd64"
      sha256 "607c379e641ed7ca92a256ea2e72a13d28375e3ab3400e843f528a263166d594"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.15/carlos-linux-arm64"
      sha256 "6587576f1aefae5887cae522770b0238e205f0b56b5ffe94de436ac52190e0dd"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.15/carlos-linux-amd64"
      sha256 "1566a225afe09d922a3e30290a2f4c7c7462d283ad1eb6b8a3c9e47393ef35e9"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.15", shell_output("#{bin}/carlos version")
  end
end
