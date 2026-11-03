class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.12"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.12/carlos-darwin-arm64"
      sha256 "e116c721577b115b52892ade8f5eebfc5fd529510ac063c2410f838b9f37cbda"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.12/carlos-darwin-amd64"
      sha256 "dabb2e03e362781f805dbc5dc46e58f5b953dc1f36c214e1d416c940ff87210b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.12/carlos-linux-arm64"
      sha256 "694dd3b496c5f43fcb5bd5105030e0ae6376d350a98423cd250f56555fcfc572"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.12/carlos-linux-amd64"
      sha256 "3fdb76676d663315b666457dbe6dbe5c02484041f1a5aff95becb4388752c171"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.12", shell_output("#{bin}/carlos version")
  end
end
