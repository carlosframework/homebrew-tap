class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.16.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.16.0/carlos-darwin-arm64"
      sha256 "b25ec40fa28c19438291e093791b501086cadebb4ec2a5dfd6e4e79840757b28"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.16.0/carlos-darwin-amd64"
      sha256 "1182b8cf263bcc6efeffa275910d78702afd6b91bd7148a910b44ef9aa6d9f07"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.16.0/carlos-linux-arm64"
      sha256 "cad0b2b46dc5498ea372656fb38e72dfe2e468c72ae44d02bed25c17053e0750"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.16.0/carlos-linux-amd64"
      sha256 "407602324a194772b904786e73b9ada6b90d3a803b2a69b2aa52c414bf55590c"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.16.0", shell_output("#{bin}/carlos version")
  end
end
