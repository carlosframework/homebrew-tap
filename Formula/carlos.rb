class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.8.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.8.0/carlos-darwin-arm64"
      sha256 "61ff1f84a1a40e3cbcc1661cd18c8a410af3ac1d056b48b15d765df39a9513b3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.8.0/carlos-darwin-amd64"
      sha256 "8a9c7f0a7ea62486917227da5735c82e5d37a854d930d2739cd2d935df18ba08"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.8.0/carlos-linux-arm64"
      sha256 "ef17fec9ac10d7f6df2ee85f03d174100734fc194c09a3cb582a3fd6a227e87a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.8.0/carlos-linux-amd64"
      sha256 "b8a9f355311b0ad9f98192baff7c3777117b54067ae8462708b3464aa17f0c95"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.8.0", shell_output("#{bin}/carlos version")
  end
end
