class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.39"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.39/carlos-darwin-arm64"
      sha256 "a4d897234ba650d04a24ac7915471976c85d6112d234169d62bbef22b46f8e9d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.39/carlos-darwin-amd64"
      sha256 "4820faf4d06319362b401e2050a41e38c5c56c0ae92217f732c660a99128c566"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.39/carlos-linux-arm64"
      sha256 "6f9576a120857ff3da856e647748c42a680e66c2b9a36dbd0f14ff058ea12506"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.39/carlos-linux-amd64"
      sha256 "70caf4a9698639a5118fd922cdd04bb1616652bbe155cef6a7022289f7921db0"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.39", shell_output("#{bin}/carlos version")
  end
end
