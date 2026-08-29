class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.17.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.17.0/carlos-darwin-arm64"
      sha256 "d1e6f42a0f413278cc4e100126548d62d2716d8f26a3f9bb8e45d96e61e5931a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.17.0/carlos-darwin-amd64"
      sha256 "956d723e12ab61504b77d91ab828d337230eb7419a670694d386fd2d9f4d4fbf"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.17.0/carlos-linux-arm64"
      sha256 "d1c5a97f1d4f4f2d458b0ba394637996799bd24bb11d440c1e79a8e586929d7d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.17.0/carlos-linux-amd64"
      sha256 "19d1148813a7dd1d9ff4d155c848fa32add78188ac10663804cc6da436218f97"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.17.0", shell_output("#{bin}/carlos version")
  end
end
