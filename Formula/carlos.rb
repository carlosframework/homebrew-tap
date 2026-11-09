class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.33"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.33/carlos-darwin-arm64"
      sha256 "a879932b777423a13903de8ef55edc516f3291619a89cc678b92f20e031b9937"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.33/carlos-darwin-amd64"
      sha256 "6d813fefc8fbaa376a7cf1f63efe10db7ce7385e21965a376c2bda645e7be115"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.33/carlos-linux-arm64"
      sha256 "c02d771c758097d1372a4a9917e673c7a2d828cdbae27a0a6a0529e7e6e767d5"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.33/carlos-linux-amd64"
      sha256 "2ee894e99e5f33985ee7cf531dcffb3f3cdcc4ce9cb15b8011c2856f08eeabda"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.33", shell_output("#{bin}/carlos version")
  end
end
