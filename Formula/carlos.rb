class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.35"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.35/carlos-darwin-arm64"
      sha256 "bac0a59629afef42a8e57dfe2a195759e94e251865a06b580baffb501f48771f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.35/carlos-darwin-amd64"
      sha256 "15dbaeb2c5911da44db6524bd967f3704b3a51b7585958376a697a8d87f015b6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.35/carlos-linux-arm64"
      sha256 "0f9ab1ef27b293c11cb5e4e2b25e23fcd518ec062849fe3d298dcf7d2edb7153"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.35/carlos-linux-amd64"
      sha256 "67922a01fe8b19a47677de475d95510fbb3c4a14ec127949c79866335b0c73b8"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.35", shell_output("#{bin}/carlos version")
  end
end
