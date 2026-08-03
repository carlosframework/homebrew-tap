class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.2.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.2.0/carlos-darwin-arm64"
      sha256 "5083dcdbe37f1df6478ea7d4802c7701754aa16c9a202b28524fa9bec9756ae1"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.2.0/carlos-darwin-amd64"
      sha256 "8c2fcbd61784ac6c6293dfc12cb16199fb4f0a2859e76c16adb7782c3fb26165"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.2.0/carlos-linux-arm64"
      sha256 "b78d68ad2a94dfc840d5559ab96639a1d0fb8ee491fa14bf4599032dd7d9fe91"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.2.0/carlos-linux-amd64"
      sha256 "367cca954874cc3648a5ef78ded729c988628c059a24ef0d2ae38e074c35a9c3"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.2.0", shell_output("#{bin}/carlos version")
  end
end
