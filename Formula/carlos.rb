class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.31.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.2/carlos-darwin-arm64"
      sha256 "7e131e5520d087fd555a65044fc10902752bcc200c2cce195ff131156d570bb0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.2/carlos-darwin-amd64"
      sha256 "52705833e76faee1bccdbb75674fc3a19562f70cf982b031d901f0b5ff65567a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.2/carlos-linux-arm64"
      sha256 "6b12588c5bd25b141b48b2e4e20e2818fd4091c77ee45e99ef169f4e4b03123a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.2/carlos-linux-amd64"
      sha256 "f784400870454d8f7c20c3f40508a8a444378bef5f9e54655f352795fd264bfc"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.31.2", shell_output("#{bin}/carlos version")
  end
end
