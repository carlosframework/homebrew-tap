class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.25"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.25/carlos-darwin-arm64"
      sha256 "16cbea5b3f8fc7493074af3581b85d94d95b1e21ed365cce1dea29ab544cabd9"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.25/carlos-darwin-amd64"
      sha256 "fb51fff3503a938b658132ef59d9c42ecad7806fca66fcd6fbde3fd642ad5e99"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.25/carlos-linux-arm64"
      sha256 "56164ec7e397dc26e839593f9e4d4eedcef8e3d137a0978735f6e293ebd52728"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.25/carlos-linux-amd64"
      sha256 "d1f73cd01b65b4a79560fb21e8929a38ca17782aee433856904282f56069473d"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.25", shell_output("#{bin}/carlos version")
  end
end
