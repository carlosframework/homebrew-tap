class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.35.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.0/carlos-darwin-arm64"
      sha256 "9d97ca9238944cdd4a4d14f0f91bd4c8fb1ed37ba9ad947b991d4fb925435b51"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.0/carlos-darwin-amd64"
      sha256 "9602aeee5c67d8763efc3833fc4dc7dc3239b557483b9de93b9edf3a70a386fb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.0/carlos-linux-arm64"
      sha256 "3f9744443644d4bb9c24887ed8376663ea625f44a2fa8a5155c44bf5a1869154"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.0/carlos-linux-amd64"
      sha256 "59f7a5530f0b5fb9e38722af9e24670d775bf8b181502b027dadb390128e0da1"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.35.0", shell_output("#{bin}/carlos version")
  end
end
