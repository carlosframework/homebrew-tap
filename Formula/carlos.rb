class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.24"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.24/carlos-darwin-arm64"
      sha256 "50a2ca43b82f1f7a550161f4b7da71aa7c1debe6d0400fa640c118c55d517544"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.24/carlos-darwin-amd64"
      sha256 "cb218e8037e01e4d84ee558cecc6970e721b135e411898564beb434c589dd983"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.24/carlos-linux-arm64"
      sha256 "40d86addd0d89c559083283682ac1636345ff07be3a097e13854a1e7da191f57"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.24/carlos-linux-amd64"
      sha256 "09f5a162b852b68a3544b001ddaf7418c11370d871c50889aa2b4f00cee8ef5d"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.24", shell_output("#{bin}/carlos version")
  end
end
