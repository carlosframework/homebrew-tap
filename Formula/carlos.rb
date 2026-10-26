class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.23"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.23/carlos-darwin-arm64"
      sha256 "15528475b0984ac0e01112e1ab7e201ca961a2f13a72c2cefeb4c1f5c357e741"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.23/carlos-darwin-amd64"
      sha256 "7427b23faf4afe31a05f19c1569efa401b7f48d8f4b6af94059c065b73177bb7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.23/carlos-linux-arm64"
      sha256 "08125e791079133cb680b09028811abadb0e7a1cff2258603442adb74c32d78f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.23/carlos-linux-amd64"
      sha256 "7d747a208bb44bcd748a601ddde2c986bf60a9a2ab0d55aec42e477bfd47f528"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.23", shell_output("#{bin}/carlos version")
  end
end
