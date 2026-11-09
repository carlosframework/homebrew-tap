class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.34"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.34/carlos-darwin-arm64"
      sha256 "428172f334bc4bfbc5b106b9e4602465a00f3ac21c30bd4a9db8e7ff10370dad"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.34/carlos-darwin-amd64"
      sha256 "8627351f819277c37ac1bf4ee230202923f312a1c2d6509399c88368fede2cdf"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.34/carlos-linux-arm64"
      sha256 "7ee416fe92f6dfb586015d6e10f39587a8c2a84184ee50cd72958b81ee756a50"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.34/carlos-linux-amd64"
      sha256 "fd69f495fcde97ad71cf4dc78f2d99b2790cf8c452c6c67cdf2e1681eb08ef4a"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.34", shell_output("#{bin}/carlos version")
  end
end
