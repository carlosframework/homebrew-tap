class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.19"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.19/carlos-darwin-arm64"
      sha256 "0655d39d1316874c7ff627729a62dfd107e6f4c2278485c2cb46e8959465cf45"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.19/carlos-darwin-amd64"
      sha256 "3ebd2e1317214b781b00c412020deffa64b4c2ebfbd58b4eb54b22f74d9ef157"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.19/carlos-linux-arm64"
      sha256 "ee97e3d2be5a0c1714cae35a574b314400f4bd776acd5dc5700b9846cb53e3d5"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.19/carlos-linux-amd64"
      sha256 "c0d14eb8dcb121e4b4e36866ea6771633a17cd80424eb7afe53a42f9990d22a7"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.19", shell_output("#{bin}/carlos version")
  end
end
