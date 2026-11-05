class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.6"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.6/carlos-darwin-arm64"
      sha256 "699d4af4577a92ed8283f3925e7dc2dce7321b874b972782a10c47d0775711c8"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.6/carlos-darwin-amd64"
      sha256 "e2673b6a4effaac3c92b6e3a08746fbeee9be18ff8625816026b6673c28d6bd7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.6/carlos-linux-arm64"
      sha256 "e3890aa5d5b71f0454019ce09b0f7ead7735544ebbf84422e1dc53b8d0ad8f42"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.6/carlos-linux-amd64"
      sha256 "a596890dfd88b0402d7aa065952d016ef709496f8e320cf3ba2735f90e203a4b"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.6", shell_output("#{bin}/carlos version")
  end
end
