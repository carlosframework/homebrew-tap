class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.9"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.9/carlos-darwin-arm64"
      sha256 "55d95e02298c82f4b5becdc2e73592370b825ffeb7ba6d5515a00ebb9e886f5e"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.9/carlos-darwin-amd64"
      sha256 "172a82003c2ee47366b1cf062107eb070c57def95c42e5e7478fdc0c928dd6cd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.9/carlos-linux-arm64"
      sha256 "bbca50b3015146d76f866142e6a7d8ab332336026db658c65cfed5bffc1ea75c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.9/carlos-linux-amd64"
      sha256 "f910f9d18dae6a4d0cd176c129b5d99de3fda36f86c62e8b83098623201414aa"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.9", shell_output("#{bin}/carlos version")
  end
end
