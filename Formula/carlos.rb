class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.30"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.30/carlos-darwin-arm64"
      sha256 "fbf2a468d181e0903ae57aa4f04d367808e385544e2eaaae26318dd128736a95"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.30/carlos-darwin-amd64"
      sha256 "84f9fe85f8747c95a8c73300794f9a698e0223cd04652817f69ed730c2deffbc"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.30/carlos-linux-arm64"
      sha256 "16e62ea5ed9ff717e71984281d97da6341c452fedf7f7e1d77733d4e80b7bf1d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.30/carlos-linux-amd64"
      sha256 "b67ee80581bbb3af7051ee92906593376e13f4fb784860382f2225b21a3035f4"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.30", shell_output("#{bin}/carlos version")
  end
end
