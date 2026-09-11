class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.19.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.19.0/carlos-darwin-arm64"
      sha256 "ee7bea52d2164320a79f8dc362dd7bcfcf4c49ff910448a93bb2675e72219667"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.19.0/carlos-darwin-amd64"
      sha256 "45abcabb08ef5678df5141d92c68043cea39ea9d6f73c2bf2f3b417dd1f0911e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.19.0/carlos-linux-arm64"
      sha256 "960172869e45d84081a3487272df558e8438ad5cd1c9dbf004fe7ebe2e9430a7"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.19.0/carlos-linux-amd64"
      sha256 "bc02a02af71c64bf469289c53802054a8933c4c154c26623fa6931d9b7d3f361"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.19.0", shell_output("#{bin}/carlos version")
  end
end
