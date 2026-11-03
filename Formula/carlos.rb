class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.13"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.13/carlos-darwin-arm64"
      sha256 "011264d93a87f80220844ac87f2f2ce1e68facea6dd8923e3534a22a4c652a03"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.13/carlos-darwin-amd64"
      sha256 "add089a44977895a8fa96a93536ac93bf9a104d44a1b919ae7643f71aa89d86d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.13/carlos-linux-arm64"
      sha256 "6d4b4fe7be52cee6d377e3c9bf1e1a27370f0233258e9065b27bddb98f26139c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.13/carlos-linux-amd64"
      sha256 "3b67257398e1d3056fca49aeff9873af2b4cfc3e07834c920cdd81d36750d734"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.13", shell_output("#{bin}/carlos version")
  end
end
