class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.6"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.6/carlos-darwin-arm64"
      sha256 "ac04b172b59f4c5343ce2d0ce93fac8cb7e66bfdedceaecffc8bd0dd85e9e213"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.6/carlos-darwin-amd64"
      sha256 "795c4a13bf44df358b28c1451f568d4b070a6f2fb91e0373c0f962a7eda09a57"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.6/carlos-linux-arm64"
      sha256 "392b8c91bf5a3658053575d74cb3d5054b6d999b80b8d028900d574bd7b83e7c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.6/carlos-linux-amd64"
      sha256 "1016aafac036a2bb167de2109535a447d7985845a615edf2e05ea854cba6d54c"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.6", shell_output("#{bin}/carlos version")
  end
end
