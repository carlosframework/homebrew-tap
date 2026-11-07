class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.18"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.18/carlos-darwin-arm64"
      sha256 "7d6db5d530624c553446494099a2f9a504ee91166ec7ac92c7bbecca0e37e032"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.18/carlos-darwin-amd64"
      sha256 "0191d67276eb968f2235eb0698f84fd14cb85617ff11384afa41b78d7e29b91e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.18/carlos-linux-arm64"
      sha256 "dfd5a0c2882f55f2f82a79c40df2f76a472da87be2e46a0d4424af80df924a6e"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.18/carlos-linux-amd64"
      sha256 "50b0612d6cc657a2650b388bee5f69eee815e95d628866069f6a9c7613ecf4b8"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.18", shell_output("#{bin}/carlos version")
  end
end
