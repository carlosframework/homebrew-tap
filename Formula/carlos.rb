class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.0/carlos-darwin-arm64"
      sha256 "c7326878797ba9686097756dfc97569c579f0ec17e14d6cccbbeaead43eb7824"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.0/carlos-darwin-amd64"
      sha256 "530cabe5e3c5129eb9c9208677db9c6b127878d616ea955a3fe45341d987f73d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.0/carlos-linux-arm64"
      sha256 "3ca7c74d5356a3995ecf677d142bc32fafaf790a2cc1bc0b628f3eec1b7ea731"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.0/carlos-linux-amd64"
      sha256 "a89b54b647f639e95a73a9e9cbcd8d6a62a070fac43bd60bf17168a51399fbca"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.0", shell_output("#{bin}/carlos version")
  end
end
