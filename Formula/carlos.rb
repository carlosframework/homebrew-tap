class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.27.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.1/carlos-darwin-arm64"
      sha256 "21973385d6b784e2c75350b8cb4ff936947c082f3a4f59e41eb17d6a5752c683"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.1/carlos-darwin-amd64"
      sha256 "879b53efbcdfa050e93214b8d7a9ac1e165b12fd7483b23547812d9ce3b06f44"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.1/carlos-linux-arm64"
      sha256 "aed409f4df08af78729ff5a01e0980d64d36aa7cb4d58bb08ea05e6c0f80f6ee"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.1/carlos-linux-amd64"
      sha256 "10287430ca3e8e0678c7596fad9e7117bb8b1bc430154b9e9afe7299c178ba56"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.27.1", shell_output("#{bin}/carlos version")
  end
end
