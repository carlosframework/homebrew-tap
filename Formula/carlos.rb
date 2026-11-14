class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.35.5"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.5/carlos-darwin-arm64"
      sha256 "8ddc7256036c52ef3688e8b27b0ece619b3462be348c7fcc0e7990a1db495a28"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.5/carlos-darwin-amd64"
      sha256 "634f129e6ab7fc4af690164f6441b5b03d335121f1ffb9f499193a82431f3b65"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.5/carlos-linux-arm64"
      sha256 "c2b695f3033d56376cab3d606a5197530429f0138c1e704ce539924815102a14"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.5/carlos-linux-amd64"
      sha256 "9c363c1918040fd4a046eb3244006bc48faf349b00b63ba3bc57972bb6efd22a"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.35.5", shell_output("#{bin}/carlos version")
  end
end
