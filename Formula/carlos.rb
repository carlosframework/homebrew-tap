class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.29"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.29/carlos-darwin-arm64"
      sha256 "28b14f60e4e1538cde706bd36175f0fae84c6c692c2b99ef21a319b0728e64bf"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.29/carlos-darwin-amd64"
      sha256 "5c0f6e55ba115f716619fc388dfc3089b22cd6e4d114ca234303629547f05a4c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.29/carlos-linux-arm64"
      sha256 "cfd4ad46019ca72054e52a9c8704174278010aaab8a598e6a8dd055283f511f0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.29/carlos-linux-amd64"
      sha256 "5e0b2be703729c8e144840446a81c699b72a9dd576c12039b0d5fe56a85b2c3f"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.29", shell_output("#{bin}/carlos version")
  end
end
