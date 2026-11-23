class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.0/carlos-darwin-arm64"
      sha256 "db627539ecd086fb9cea3055d33387a4241e80683d2c2fc393c45d3667f16d65"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.0/carlos-darwin-amd64"
      sha256 "f471cb62505569070d5573bca62539d6a2872e15cc04755c3e05fcc001172d9a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.0/carlos-linux-arm64"
      sha256 "ee8b7bcc8f663807a0b3fa3125a4234cb91dff10f4f26f2690cce7b69b9581bc"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.0/carlos-linux-amd64"
      sha256 "392d69f639ad33cb5a840825499c38118c4b48665cffa52afaa2d6ee675bea48"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.0", shell_output("#{bin}/carlos version")
  end
end
