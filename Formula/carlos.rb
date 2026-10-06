class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.24.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.1/carlos-darwin-arm64"
      sha256 "b5aa80fb5c5357cdc9e921ae639c2f5298a5e1bfdb121608501d122492723808"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.1/carlos-darwin-amd64"
      sha256 "4ccd9319aa276723d2617084ff7d17d551715472e8e83fa701044b736fd8bb95"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.1/carlos-linux-arm64"
      sha256 "d051b286aed0835ee61d53ebacf120b09661f594c2d2c2d794f9f28a61bbb351"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.1/carlos-linux-amd64"
      sha256 "d741af3e367cfd6b94a2076786c337b3cb9645f79a8e8ee5e914cdbfbea3e2ec"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.24.1", shell_output("#{bin}/carlos version")
  end
end
