class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.17"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.17/carlos-darwin-arm64"
      sha256 "d7f275cd9f2ad494342ef10e999df1c4b0c4c507646d4a86a52c92be41cdbfdf"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.17/carlos-darwin-amd64"
      sha256 "7b1a6c6cf8c99e0f034819febd4cdd2655e8e7ea69b4a4dfcaebe5ac48f4eae7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.17/carlos-linux-arm64"
      sha256 "2570e5e677c5161a753736bfda37f56737b3dbd5487b593293d0c40a88be7648"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.17/carlos-linux-amd64"
      sha256 "6694f17832906024f981260c9dc828b4b7d8883ac07300f37dfd6660d6adf20d"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.17", shell_output("#{bin}/carlos version")
  end
end
