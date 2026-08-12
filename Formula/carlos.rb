class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.7.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.7.0/carlos-darwin-arm64"
      sha256 "5683c5e9280aa28117c819de5a2e1ab9d6c6318fcac17ba9862635feab2333dd"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.7.0/carlos-darwin-amd64"
      sha256 "0c269d60e74ffa69a4e083f0049d82c3b80d724d1da8d40855af1fa703c7ada1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.7.0/carlos-linux-arm64"
      sha256 "239425bbbf8ff470b8c6f10eed9bfad95bc7a1d86d3bef30d636f2f7f6dfcc58"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.7.0/carlos-linux-amd64"
      sha256 "d67fd85032f03b7f69e20da9d3fd3e372590efd52117e9a904f4b5eafe6d45e3"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.7.0", shell_output("#{bin}/carlos version")
  end
end
