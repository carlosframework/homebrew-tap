class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.40.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.1/carlos-darwin-arm64"
      sha256 "6f9ed4d7f671531f8b3889995b24f8da956aa246510434793de143ce826784da"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.1/carlos-darwin-amd64"
      sha256 "d6d5e8c27cfd115fefd6a7cbd62349cf96fd74bf422834c710a02acde9cdee58"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.1/carlos-linux-arm64"
      sha256 "139adfd9f8f99a023de22df6069bbaa85c75fa7cbdfab43fa5b81dae0eea1e7f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.1/carlos-linux-amd64"
      sha256 "4ea98ecce1c08f6f160201b5d7156dce4f444118ced966c587326f144e4b0f84"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.40.1", shell_output("#{bin}/carlos version")
  end
end
