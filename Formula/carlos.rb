class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.26.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.26.1/carlos-darwin-arm64"
      sha256 "299c4832bb7c4bb6f36e11073820f8bc8a8ae2cce20244708acd899b47178197"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.26.1/carlos-darwin-amd64"
      sha256 "5b207f632c53a904bd2c8fc63ac37809a76d799808823ae3f15055315fec6ebc"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.26.1/carlos-linux-arm64"
      sha256 "f2bc174971676d78b7d5b32e0a6d81160ac320172bedb66006601bb820c821c8"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.26.1/carlos-linux-amd64"
      sha256 "db955c119b4cef19ee872efb2f5b20e8e97917288b842ca20a6080b63c4acb08"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.26.1", shell_output("#{bin}/carlos version")
  end
end
