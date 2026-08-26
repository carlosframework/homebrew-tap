class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.14.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.14.0/carlos-darwin-arm64"
      sha256 "b304d2650821510c0dc3d92000de811fa4702959d4410650f6968ec54694c17b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.14.0/carlos-darwin-amd64"
      sha256 "6a3020fee2b7c333caa6f2c867fb2692f9879cba9fbd3b0fe6201d2879595a40"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.14.0/carlos-linux-arm64"
      sha256 "56a56b85dfe46e11b7405132e8bce6fafa9dc80ab8d11e2fdc7b66d03ab37fca"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.14.0/carlos-linux-amd64"
      sha256 "5b000b8c2a0b9e9be7c9fb692f15c3c54ce8e7c3756ea93bf45962195fac999b"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.14.0", shell_output("#{bin}/carlos version")
  end
end
