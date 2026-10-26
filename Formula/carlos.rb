class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.20"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.20/carlos-darwin-arm64"
      sha256 "bc233e3a38312b986610733484e36479b8758bc899520ce9b1a5569c5cb542fb"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.20/carlos-darwin-amd64"
      sha256 "f4e2ee3bd4d10c3ccf3c9c14743f6dafc36381137e8014cdf7f60fad4b72f367"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.20/carlos-linux-arm64"
      sha256 "1f0142949edd5a7bee586903b0adf42e90001b7552f0c9d2949b853a98e8d91d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.20/carlos-linux-amd64"
      sha256 "476e868ee7158decaf88ebeae2b094ed05c5afdaefd8c06e868a7913217e5844"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.20", shell_output("#{bin}/carlos version")
  end
end
