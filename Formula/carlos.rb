class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.5"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.5/carlos-darwin-arm64"
      sha256 "f7163025ae8b65aa18cc8853f40d2c7c0b44495a0542d87685f77f5c87b33aaa"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.5/carlos-darwin-amd64"
      sha256 "3837326b400f0211a8c702935d6534a855d2f732879412eaf6ac6f636a307a32"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.5/carlos-linux-arm64"
      sha256 "310ab5b97a52fa0d4c033393c3d2649adeda2c53e842fff81cd0c7ef57e16cd4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.5/carlos-linux-amd64"
      sha256 "400d62739efe8994f93d0ca96dc3a6d0d499e6f4ea53db64069177dea8360176"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.5", shell_output("#{bin}/carlos version")
  end
end
