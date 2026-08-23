class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.12.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.12.0/carlos-darwin-arm64"
      sha256 "e00b738f2b7349ddca9248240994411a116cef0f773c9a76f1ff4163d55ba0a6"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.12.0/carlos-darwin-amd64"
      sha256 "632d9f758e2b8883074c40e4dddc7941c84913c58d462385eaf92a30dfc9f760"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.12.0/carlos-linux-arm64"
      sha256 "d9de9654fb1c38dbf10bbe0a50b152321878a694ffa16f29d422ed652ef7af52"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.12.0/carlos-linux-amd64"
      sha256 "8d7c6eb21590027f0b6f291aabb4c382c47758a1884a1cd1257e28cba9369386"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.12.0", shell_output("#{bin}/carlos version")
  end
end
