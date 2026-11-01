class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.3"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.3/carlos-darwin-arm64"
      sha256 "9520295ca2ad70291a088a20342a0e847b0d4a8a6dfc0a12b7e0fa0176902718"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.3/carlos-darwin-amd64"
      sha256 "7b8f5c4431517eb5720557a726274f03b7db40fbf9c6309adf305de05a547f53"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.3/carlos-linux-arm64"
      sha256 "2957ab1955c1dae6b5b25621797df74d16164ebbcc2057cdb6d458f0ade2feac"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.3/carlos-linux-amd64"
      sha256 "d098009ccd2b71962e05dba463b78814f566cff99d3f01a4891461e662d8601b"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.3", shell_output("#{bin}/carlos version")
  end
end
