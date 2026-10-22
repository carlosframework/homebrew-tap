class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.9"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.9/carlos-darwin-arm64"
      sha256 "87260f72bb877bdf6b97b0411701c72f65efb14a7b983df9eca43f401260d5f3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.9/carlos-darwin-amd64"
      sha256 "03bacce99e857881bdf049eece8138d5b55941a7d03316bb6fd92b1440880062"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.9/carlos-linux-arm64"
      sha256 "d35d675aa9625388aa5147fe7ea0f8902c69e3235b52198262b02bba5759328f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.9/carlos-linux-amd64"
      sha256 "3896b4d6fb0d65ece6f67501a0ef6de7622975c673fadfe83ab44e9be7c350cf"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.9", shell_output("#{bin}/carlos version")
  end
end
