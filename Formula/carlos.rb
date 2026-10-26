class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.27"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.27/carlos-darwin-arm64"
      sha256 "d675c1667a507c14f4626522c6456b2a74a4219b77436a4863f266963e709ba6"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.27/carlos-darwin-amd64"
      sha256 "9b9cdcadd905a8052ec432c669d6c2d7417358e3c0f9e09d55987c1256ecd390"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.27/carlos-linux-arm64"
      sha256 "88ba817ed00e07ed6d5977d888a7d0f20b80336d4ca8f5ed37f591cca01e80a2"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.27/carlos-linux-amd64"
      sha256 "929786cc6dd1c6c6d164c0d04b138d6f40f07b35caa2b8855800531d0d93fddf"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.27", shell_output("#{bin}/carlos version")
  end
end
