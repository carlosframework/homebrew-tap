class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.21"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.21/carlos-darwin-arm64"
      sha256 "f753a12bdff3ab0fe30e98096cebdec25733bbfcdf4d0f784a49a7153aa5a5a0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.21/carlos-darwin-amd64"
      sha256 "a99ea44b6e4120b9a3d4df1f935fea273575f4a513aa404cf6b4dc24952443c7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.21/carlos-linux-arm64"
      sha256 "09345eb9d48cde8960ad4b81d843b743adecbcb1134cd8fabaa3f6a7b4036f65"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.21/carlos-linux-amd64"
      sha256 "1c0bebbf6d2e569a6e3cce626769129cf1605df450bf67416413a02b178599f8"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.21", shell_output("#{bin}/carlos version")
  end
end
