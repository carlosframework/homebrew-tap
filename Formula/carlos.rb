class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.31.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.0/carlos-darwin-arm64"
      sha256 "539585e591dbec2d12b54876cd689be06dfc1a3e32898a0fe53a0e161d1414b0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.0/carlos-darwin-amd64"
      sha256 "09013a083f36053b011c1239f55f9faa347bef1ac0122f21d69d1e317c759391"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.0/carlos-linux-arm64"
      sha256 "54fe560d4ddb15b74618ea8a086d3bb4fb4ac70a37fda2e026b52abd77c22fad"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.0/carlos-linux-amd64"
      sha256 "c1688b0d56fa5cbc076b4219537e38a38b222e0c02a905c1e4a0ebef042ff8ce"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.31.0", shell_output("#{bin}/carlos version")
  end
end
