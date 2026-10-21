class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.8"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.8/carlos-darwin-arm64"
      sha256 "8c45c2e5b62b6a05ef7d0e88bf5b48928a638281c8a5a9351db912b5285233b8"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.8/carlos-darwin-amd64"
      sha256 "69425ef6e4cbe155326117a705d8ac822981e78a2d2eea08f2ec0ceb8b572971"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.8/carlos-linux-arm64"
      sha256 "9f0840b1a0bb458dd0e9a6ede86f3ae9a9253a4d56aa43b1bf30f2adca48f348"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.8/carlos-linux-amd64"
      sha256 "67b8859567a119d4de7a5b1c39ca5c1791f0b8762197af50dee41ba7a4c4af8e"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.8", shell_output("#{bin}/carlos version")
  end
end
