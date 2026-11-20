class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.40.3"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.3/carlos-darwin-arm64"
      sha256 "d710a355553f11c292f595ac2ffd455ba142d674d9c0b7f9d480e4d27cfc4fab"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.3/carlos-darwin-amd64"
      sha256 "8a802c80c034ed74c3dcf3f5cd7d5dd830771ddcaf4b20eaebc52a9f04e63070"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.3/carlos-linux-arm64"
      sha256 "291f79512608e5c95ef2cc6fb8aa4e52b095373970f0901da09e0700003add99"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.3/carlos-linux-amd64"
      sha256 "cbd5e9d6af16e7548add4bb30df343715387b3da0056bc177d752a0de8750f61"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.40.3", shell_output("#{bin}/carlos version")
  end
end
