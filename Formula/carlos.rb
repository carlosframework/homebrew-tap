class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.31"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.31/carlos-darwin-arm64"
      sha256 "e51de854801654b83357b32093b9ba0eb3a6840ae5b15eb321e0428b51870e29"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.31/carlos-darwin-amd64"
      sha256 "3eefc99de1a086b22e3d3df208b3f7ddab38f666e565987c544dc29b6d7606ce"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.31/carlos-linux-arm64"
      sha256 "816bdf32bea6ca86342326c6c5a55214d87e0102b95c0d0a500e8baed5affca6"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.31/carlos-linux-amd64"
      sha256 "5e5281f15bc19e9bdd795de00f91fd75d38aa12d013814e7ee99db0bc44980b2"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.31", shell_output("#{bin}/carlos version")
  end
end
