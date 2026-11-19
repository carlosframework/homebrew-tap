class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.40.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.0/carlos-darwin-arm64"
      sha256 "13c757d86209ce3198a9f5a3cc9b572d3c50551cf59f69962b70469fbc6a5fbd"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.0/carlos-darwin-amd64"
      sha256 "c09c88758d98943b79bf421ea28ca114e4febac60491dcbd358970c5a01a3fbf"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.0/carlos-linux-arm64"
      sha256 "1b53cb7962dc5e62a62c9f1098461c2c4bee0e859a3f603d7850c489c75ef47b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.0/carlos-linux-amd64"
      sha256 "d69fc4bca810f854671fae136190b7ffeb25eb9028f31d1dd388eeddbecbfb73"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.40.0", shell_output("#{bin}/carlos version")
  end
end
