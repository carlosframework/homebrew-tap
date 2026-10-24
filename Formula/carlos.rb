class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.13"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.13/carlos-darwin-arm64"
      sha256 "35454941eda7e36c5df5d51dbc489844184212c77e6a9d60b205ac6c196f8fc7"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.13/carlos-darwin-amd64"
      sha256 "574aec8c6f8213a03d8a1bf2dc4fc21ef909f58b8c593de47c7c963ad541e13e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.13/carlos-linux-arm64"
      sha256 "f40d13eec73fe66dd17e3b9f2975d6f1eca7d842c0df4c151e63f6ea65c4784b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.13/carlos-linux-amd64"
      sha256 "71c29e239ad3fe508a140f770ede2fef477595e54fca859e16d638c1d393259f"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.13", shell_output("#{bin}/carlos version")
  end
end
