class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.17"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.17/carlos-darwin-arm64"
      sha256 "282cead413b1f5e627d7f39fe13672752ee0e6102f8053f285d233f9681e5464"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.17/carlos-darwin-amd64"
      sha256 "a925ecbba077f2eb986061477605dbfcb5dd888f1345684a4b44c4c34c441c99"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.17/carlos-linux-arm64"
      sha256 "26bb4a596986b7fe244cc0007768de98ad413b3cb7897e24b87444f8fb74b0e3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.17/carlos-linux-amd64"
      sha256 "417f39d83df0168cd4adf7b1a6cfdbd8a9856d87e2b064207ff34a2c0b57ff38"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.17", shell_output("#{bin}/carlos version")
  end
end
