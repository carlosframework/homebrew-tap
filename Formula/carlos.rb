class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.10"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.10/carlos-darwin-arm64"
      sha256 "ac81e9cef0bc39e13abef3641eeef92c04811bbd1f88d3da3377437924d4c251"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.10/carlos-darwin-amd64"
      sha256 "98de816b6dbebc60d358a4a6d678406fc862488607133dcb72dd0615f7c8ad02"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.10/carlos-linux-arm64"
      sha256 "727246befb271eeaa60f3120db4d7dbe88cf47aadcf98c34269ea72e756aecc9"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.10/carlos-linux-amd64"
      sha256 "812d8eaf58bfb69389c6579c99915161c36ae48be1da42fcb7c287868778f39c"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.10", shell_output("#{bin}/carlos version")
  end
end
