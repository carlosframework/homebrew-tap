class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.6"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.6/carlos-darwin-arm64"
      sha256 "53b3770ebfa450cd4aa565b0ab7a16299bf0161054ea9f5eaeaf902915b62987"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.6/carlos-darwin-amd64"
      sha256 "79c240310d0f8e9e2d2bab08e9a3b64c504d2c814e4a1b8b99cd1b7b1d073441"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.6/carlos-linux-arm64"
      sha256 "73ee89c7b0ff4004d5e10210f3ccf29182f309263a03fa0e44c1adcd191c90e7"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.6/carlos-linux-amd64"
      sha256 "c04eeb248ad77f21efee7e6376d407e7a036dffe5d1c7d90e052843226564649"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.6", shell_output("#{bin}/carlos version")
  end
end
