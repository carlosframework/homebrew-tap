class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.42.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.42.1/carlos-darwin-arm64"
      sha256 "552891964ff02fe40602f1342c3482d205f3485beabd645b3ab7da98ad46458f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.42.1/carlos-darwin-amd64"
      sha256 "dce93afb8cf2f6e2c64374029be29fe1740ca5b3cad7ddbe02bc4fd9d49d3378"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.42.1/carlos-linux-arm64"
      sha256 "617c6e9664ecbb20345158015a5dfaeb1fbeb9b4bfe86a4223619b25e8e0883d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.42.1/carlos-linux-amd64"
      sha256 "7ae8f4b3b70d8fe7bc1652d44296db233fcff9e3a0754b00267b639780a1af59"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.42.1", shell_output("#{bin}/carlos version")
  end
end
