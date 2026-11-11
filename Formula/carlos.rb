class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.47"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.47/carlos-darwin-arm64"
      sha256 "97fc164f2a0615fa5903ef410367744cccce301b84e4f154daec8f0e90de1647"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.47/carlos-darwin-amd64"
      sha256 "496a1c23f7b4b8e3225fd2f52f6799effbf174411b26b9e6abdc6cd4167361d9"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.47/carlos-linux-arm64"
      sha256 "7bdaa260ff3de576d6ab642d267d6c3e0f1efd0913f012ad1fce6ca62fcd6072"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.47/carlos-linux-amd64"
      sha256 "4aff2e69786b0d672a9f8a393d6b7aee310730bc7a40aa63190b628ee0ae2493"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.47", shell_output("#{bin}/carlos version")
  end
end
