class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.28"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.28/carlos-darwin-arm64"
      sha256 "ac98b7de447d6f51ec8b2f622ab120f8524c854b84f73045d495f8b2a089b791"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.28/carlos-darwin-amd64"
      sha256 "fbc84b2c8f9516bb03e22ba2f96160d35a3e0322c49aad940d868ae319e5cf6c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.28/carlos-linux-arm64"
      sha256 "beb2eb5b70372380f2e8a4166ccd9bcc16b78ac07d4fc23367f759824c23128a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.28/carlos-linux-amd64"
      sha256 "402ff8d0bece1e8d000c5cbfc662f4045a199ddb95cc5bca0aba18c139195cfb"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.28", shell_output("#{bin}/carlos version")
  end
end
