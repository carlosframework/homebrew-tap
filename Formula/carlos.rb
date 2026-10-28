class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.30.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.0/carlos-darwin-arm64"
      sha256 "fe0550a75895b7efbb4203e12dd267c61a4cf94f25bd5fd5ac534314e5f63ad7"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.0/carlos-darwin-amd64"
      sha256 "316dff138bbeb577ddc918895a2ab0da41e731b1e0a00eb25adbaf726e4fe16d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.0/carlos-linux-arm64"
      sha256 "b5210a1d10eee44d41ad45243978fe94eda02c1019f8f63870c1b620816f6a25"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.30.0/carlos-linux-amd64"
      sha256 "117a34ae07049d53ef2283a3cda3229e21c6b19d9fc88926896111fd711b65b1"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.30.0", shell_output("#{bin}/carlos version")
  end
end
