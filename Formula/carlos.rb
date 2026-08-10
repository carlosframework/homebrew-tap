class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.6.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.6.0/carlos-darwin-arm64"
      sha256 "a013199b6aa409e7f20b34f7c8b16f3db91a5bd7f4eccc474ee0b73725528e16"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.6.0/carlos-darwin-amd64"
      sha256 "02ca5b850d5eb6c81537b87d234f2fba8745f8207fc623fb1c3ef70d362c3da7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.6.0/carlos-linux-arm64"
      sha256 "d42912ef8f2350a02f5cfb6a718b812a83c375c8581b50135b834e98d75d8c6c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.6.0/carlos-linux-amd64"
      sha256 "bfd3aef78eee1892dcfab2e982ec9623b87c229e1ace3abc7ef48bb33c19b4b5"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.6.0", shell_output("#{bin}/carlos version")
  end
end
