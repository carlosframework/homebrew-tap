class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.35.3"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.3/carlos-darwin-arm64"
      sha256 "42beff9abd3b85350ac545965f597d0463980db484d582d975ce9a2560f31d53"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.3/carlos-darwin-amd64"
      sha256 "2866524449c4c72997ecfa4617c792d11b052db4376f37595951b94256c1d0fa"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.3/carlos-linux-arm64"
      sha256 "ff1074f79901349eee38b12e386029a9bfc6d73cc08ed33847b7532b88107d9f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.3/carlos-linux-amd64"
      sha256 "de6d23c7bef916e4c235a1ca3ba40629a8ade6a3d489a67a8ff1a7af79c3f115"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.35.3", shell_output("#{bin}/carlos version")
  end
end
