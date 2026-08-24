class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.13.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.13.0/carlos-darwin-arm64"
      sha256 "3bf540814dd45b980b0cdfe568e25ba2ada671030ea0c70e3a3bcf0d4762e9da"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.13.0/carlos-darwin-amd64"
      sha256 "39d4146f5037f20822ec9fb79ce4f46753f6d3c88b3c78fc34fb073bd4232cf0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.13.0/carlos-linux-arm64"
      sha256 "416c095c4794a42fcffc72c34de91185bb408b2d939021fde6f8156d381709c6"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.13.0/carlos-linux-amd64"
      sha256 "39127e1eae7e7dbd0d18c8c812e6204c92967f242f09d0b8881a6a79ff5c5953"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.13.0", shell_output("#{bin}/carlos version")
  end
end
