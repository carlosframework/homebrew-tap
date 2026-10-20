class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.5"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.5/carlos-darwin-arm64"
      sha256 "2dd1f26e3c0e129087bba8769fc3183e47cfa24a4d29aedd3103c7ec727cd495"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.5/carlos-darwin-amd64"
      sha256 "a2cb03bdbfe172f3fc23d7870466fd9509ef0419faf801b74738e3f38bc71eac"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.5/carlos-linux-arm64"
      sha256 "858342a3202aa5a5bbac2b8404b0a6c47a8414fe4af514d78809c2e6412a968b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.5/carlos-linux-amd64"
      sha256 "505dfc4ffc5eb5fd6ff437d37468a3238a43e4bf2b3d4bfc4a838326a92dec0b"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.5", shell_output("#{bin}/carlos version")
  end
end
