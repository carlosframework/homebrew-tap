class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.10"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.10/carlos-darwin-arm64"
      sha256 "de1dd03cb5bb17a9ec2e5a9c6b1d8277c07dfe7d57245881c58508979b301279"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.10/carlos-darwin-amd64"
      sha256 "357c3d5794ae8b1aa106658b3858dd664e10cfeeaa0f8413162a05ef93e4bb17"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.10/carlos-linux-arm64"
      sha256 "3a735db7b29dd6dba764ea33eaade5f9134de2200ef85cffbd5a4710479fc10a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.10/carlos-linux-amd64"
      sha256 "61ace51b131bfa6f00dec7c12cf3fc7d862873c769b142febde77e517af79cf5"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.10", shell_output("#{bin}/carlos version")
  end
end
