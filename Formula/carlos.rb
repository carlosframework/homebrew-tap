class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.36.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.1/carlos-darwin-arm64"
      sha256 "9a65ac8669317d7336244478d6d1380f220ad3844c88151257fef71eaf03a68f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.1/carlos-darwin-amd64"
      sha256 "a64bd1147c4e5aad0e2c8243f3d8881b33ab917fbd1298e36cbf5b4bcdc89b1e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.1/carlos-linux-arm64"
      sha256 "6557ba3943e5fac3f43716d765e20e53b9586f704854fd2622b48efb320a1f08"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.36.1/carlos-linux-amd64"
      sha256 "a6f9b003c77b72eeb721e47be385a60073dba98bba08512e2c776963d826f063"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.36.1", shell_output("#{bin}/carlos version")
  end
end
