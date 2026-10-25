class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.14"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.14/carlos-darwin-arm64"
      sha256 "654b2535078dd4178f66ecad3d46248c19a919b1b4f31d5d9287f7c49ee0efa5"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.14/carlos-darwin-amd64"
      sha256 "78319008315c1b30810c980bb418e89713fe4e7d0d9d2d52bdaf0a8c124f4dcf"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.14/carlos-linux-arm64"
      sha256 "e06e0272bd2826bb95cea6eb71b6d8a4d03f1bc3441cccec89a2ffe497c953fb"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.14/carlos-linux-amd64"
      sha256 "4bb36ba4f058ea5f98d79b0eed0e74265334918cbb966e2aaca87f86faa14df0"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.14", shell_output("#{bin}/carlos version")
  end
end
