class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.22"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.22/carlos-darwin-arm64"
      sha256 "2c98bebfd5629e69889789b17c7beb106aacd2d0229a66357a4d4c5fe21c0f7c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.22/carlos-darwin-amd64"
      sha256 "b928cc7ecdaf6d44d9eda60a8ec774d84087c7aec2abf806b1548e5434bdd5b4"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.22/carlos-linux-arm64"
      sha256 "330d53b7683cdc33799ce06a3ad098a041371abe369a644029f870b658f08bf5"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.22/carlos-linux-amd64"
      sha256 "47b28bd6fb4c85732e6594aca14f72181fa9f096d6d2c09625fdb04e7b9945ac"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.22", shell_output("#{bin}/carlos version")
  end
end
