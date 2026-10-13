class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.27.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.0/carlos-darwin-arm64"
      sha256 "a846974c11fe093b1b05e0c99b94125362515b601efede91160eedbe79c27f7e"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.0/carlos-darwin-amd64"
      sha256 "6e67fb8c43e295a49513e628a0bf619335062d6b5df97b3620042164509db999"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.0/carlos-linux-arm64"
      sha256 "09ffb2b0871de7c90aa231bf8459bf37b9e88acf806ec5a52bfb1d15794de6ac"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.0/carlos-linux-amd64"
      sha256 "c0920457b6339fcc903eca61346720c8ec8b2018df0f8dad718c01da9222d03e"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.27.0", shell_output("#{bin}/carlos version")
  end
end
