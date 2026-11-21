class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.41.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.41.0/carlos-darwin-arm64"
      sha256 "f3ffc374b92566e6abf2028f557439d59cf9444daa12d72a62ee94171807ae75"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.41.0/carlos-darwin-amd64"
      sha256 "78e9ed04f891f35f6daf95e868e22e488cf378112083b9b31d1800f7c6d25e43"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.41.0/carlos-linux-arm64"
      sha256 "ed91f9326aa9592d5f75b95e067c17057a3e1092ee24dd5e94c9d6cd6cb3d7d0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.41.0/carlos-linux-amd64"
      sha256 "69ae6073d1c094298cc673740a68aff6cbbbda7611c388f1d7fc312e920fc6ff"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.41.0", shell_output("#{bin}/carlos version")
  end
end
