class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.18"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.18/carlos-darwin-arm64"
      sha256 "7b11d57424ddf5b40881b6e459789134abcd9073bde6eaf4d92f5194f0307814"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.18/carlos-darwin-amd64"
      sha256 "dd12dc930a72d5da5baf79680c7f367dc5258046f2f06e6d0fb307d7d5ac55fd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.18/carlos-linux-arm64"
      sha256 "a76862ff24c83988b5522534c9a32ac4071bdf770a73dc6d62cb881405c705a3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.18/carlos-linux-amd64"
      sha256 "960a12d4760ed24366ffd22a966ea939a04af452a56214e79403ed6e65e4f0d5"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.18", shell_output("#{bin}/carlos version")
  end
end
