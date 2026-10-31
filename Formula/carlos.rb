class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.32.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.1/carlos-darwin-arm64"
      sha256 "c8e40ecc48bd95140156e48379558bb126d1d6d1c2addb4f03f6d058da730bcf"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.1/carlos-darwin-amd64"
      sha256 "ab6ab59a382f1e2083d38e9c3fe33351dfd6396310380b855a2fc3c8f32c36ff"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.1/carlos-linux-arm64"
      sha256 "583e2fc5261b5768b61f26cf3d461d7bdc584dcfc18a9a33f070b582c9dcd43b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.32.1/carlos-linux-amd64"
      sha256 "3211d4bc8de738416e8b807c4e8c2ef38e018057cbdc271bd16621b5dcddf419"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.32.1", shell_output("#{bin}/carlos version")
  end
end
