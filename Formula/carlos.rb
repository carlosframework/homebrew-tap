class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.0/carlos-darwin-arm64"
      sha256 "8cb2f2f2ef0b81b087f48a6701aa4360188a24207813023fcceff9f0611c7503"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.0/carlos-darwin-amd64"
      sha256 "9e7e854d5f39f53cfbf10b9f84f8c16aa960d184108fa3ef0dcb0d2e0725476c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.0/carlos-linux-arm64"
      sha256 "d5ab0124a5a106518f157a9d9048119cb2c7066c9526549adacab725b7dc39ce"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.0/carlos-linux-amd64"
      sha256 "ff40c7ee1591b1a9d56b265454848dd6fc7e772b15ce34323e28ad5ae8f279c6"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.0", shell_output("#{bin}/carlos version")
  end
end
