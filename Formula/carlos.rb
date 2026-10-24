class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.12"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.12/carlos-darwin-arm64"
      sha256 "2ac36c33c50b1296a58dba957dce4fc7b3e372ac5f94f7a76048198d40fc2edf"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.12/carlos-darwin-amd64"
      sha256 "9090827a6d0e47306c765aa6a5a88d4e17cd5dca59d6251a8bd8212457c7a3e2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.12/carlos-linux-arm64"
      sha256 "2b2b0fab6f553667486b9186bed28b48ca473b37d333e78146e1a3eb88a64e41"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.12/carlos-linux-amd64"
      sha256 "c780937ca45dfc60af789da4d30f805c79341b904762c0bc6fb02fb16d7bad6a"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.12", shell_output("#{bin}/carlos version")
  end
end
