class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.26"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.26/carlos-darwin-arm64"
      sha256 "2dfd684744296dd6913d01fcef87fa7eb2901e4f4400f34f0e95c321051a8cb7"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.26/carlos-darwin-amd64"
      sha256 "f8bdb2702062c7e94911dcdf258fd104545c9b1c12e3157676ff526029c5f3ce"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.26/carlos-linux-arm64"
      sha256 "3908780186be77acfda3324497fbc08bdd6e885b5851aa3f5023e652566295cd"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.26/carlos-linux-amd64"
      sha256 "d7642db1421fd78040dfb4fc533d2fa4877eda0ff420cd28a760bdba37cba421"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.26", shell_output("#{bin}/carlos version")
  end
end
