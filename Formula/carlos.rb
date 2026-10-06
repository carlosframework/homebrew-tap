class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.24.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.0/carlos-darwin-arm64"
      sha256 "302c706aa07f7a243e015e202f607e47c79eaf9a68961da8ff7696568f259a25"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.0/carlos-darwin-amd64"
      sha256 "6cb41b7ace1da8878a202e9b397ca60c0ed05b4ce80b0e3881bfe415e0f62d6b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.0/carlos-linux-arm64"
      sha256 "274b58bb9d0a0faeec59558f224060801573ccfc2bbc9bfaaefa2d4e77da25fd"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.24.0/carlos-linux-amd64"
      sha256 "61c7613b457b12476421ac6059b78a8b1674f1531867159aa50d3a9feff06bc7"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.24.0", shell_output("#{bin}/carlos version")
  end
end
