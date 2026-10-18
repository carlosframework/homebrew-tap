class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.1/carlos-darwin-arm64"
      sha256 "8f3466f5b8d98b22647a12b191c17f2d46e36715b14e37cade9f983a8bdf7d84"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.1/carlos-darwin-amd64"
      sha256 "e82c15c3b2b21cde1c35d8b844fc5e10355179a4a117f828ffc85e1fcf25c257"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.1/carlos-linux-arm64"
      sha256 "2ae174da29b1d10fdcb009172ba830db5460b62e838bcecc7d9e17535f35adea"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.1/carlos-linux-amd64"
      sha256 "35f09e8ea81cad55a8aa6d1f27ad63508a325c7777700f4426c0213095d8fc4c"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.1", shell_output("#{bin}/carlos version")
  end
end
