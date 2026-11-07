class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.25"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.25/carlos-darwin-arm64"
      sha256 "682377e74598d9fc5940159347198a31ac358883ffa6dba58c2ac2d38ec4e90f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.25/carlos-darwin-amd64"
      sha256 "b84e0b3188be30856bff6a981840d172b6703f234a021edc045a9d81e643a0e0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.25/carlos-linux-arm64"
      sha256 "319ce95cfacdb047b682605e17b7bb47fe883c57daecb66d6c5c7cc8dca478eb"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.25/carlos-linux-amd64"
      sha256 "d37e26c938bf8f08fa763b36dd877df5dccc91adbbefa8a071aa2aeb8ba5cbb6"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.25", shell_output("#{bin}/carlos version")
  end
end
