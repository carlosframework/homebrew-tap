class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.5.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.5.0/carlos-darwin-arm64"
      sha256 "b947169cdf4bc8e73e307f57f5092ed9ae1735b337f1d0e23ae6c70ceef58b5d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.5.0/carlos-darwin-amd64"
      sha256 "49be2eb4c17f89b19eb58a21b665079c666a1481a9782f40d083950296086915"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.5.0/carlos-linux-arm64"
      sha256 "75c5695b4b416c2b7dece3850643aa2f35521f4ed1c003cfebe922bc135c1504"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.5.0/carlos-linux-amd64"
      sha256 "8c5da2fae757a81ca506f7aa1df8e8adc9602a62b847bf94d76d6f88d6daf820"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.5.0", shell_output("#{bin}/carlos version")
  end
end
