class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.4"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.4/carlos-darwin-arm64"
      sha256 "64c5a6b76ffab154c9840057a3d8856a48806081ad41b8bf82d3f2d4f929500f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.4/carlos-darwin-amd64"
      sha256 "fb6b8af23af94ace3933fe974c317556e9fabaeced70f403dc4b5def162ad7f7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.4/carlos-linux-arm64"
      sha256 "736826e40d5c1de399678e8bf82bbd15c0a5123f766089d5b42d0539f2ea4b21"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.4/carlos-linux-amd64"
      sha256 "2d53162fa28accc724a0571f8c7ff59ca36c9050201446e3f33faf4a6f608548"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.4", shell_output("#{bin}/carlos version")
  end
end
