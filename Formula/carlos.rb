class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.38.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.38.0/carlos-darwin-arm64"
      sha256 "33edfa058e7f5d822b8046ae4a1aba2ea4eab7eaf3d968e624e11b40ecc15a22"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.38.0/carlos-darwin-amd64"
      sha256 "b490ed97d8cf774cc2575d0ce78d71e4cab3274d523c283f39cb7ed461cd2848"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.38.0/carlos-linux-arm64"
      sha256 "6260dbd26ba23c6c3423b6fd2ae3a7b48a51a5f1fb7f2b7f91fa21a5b733ab23"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.38.0/carlos-linux-amd64"
      sha256 "5aabe05db723fe7822cf25171dcc942468bb3ae9acefacb981d468f77370cfb9"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.38.0", shell_output("#{bin}/carlos version")
  end
end
