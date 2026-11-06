class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.15"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.15/carlos-darwin-arm64"
      sha256 "3114e1c0366e68117b75ee7a9cb58a1f96904143bd73792e3ddb4ac7d80699a1"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.15/carlos-darwin-amd64"
      sha256 "f28654e7f8388b331adacdf0e8664bfff98f6283f2385c0bce7c97ed4fe74aa3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.15/carlos-linux-arm64"
      sha256 "8e0596a1ba4ae4d4e116641b32db81456615ac430f399c144406fdd2c8076680"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.15/carlos-linux-amd64"
      sha256 "e648cf22dff8fa53712b193993af48f333faf7b9ccf8953b53de2a00644701b3"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.15", shell_output("#{bin}/carlos version")
  end
end
