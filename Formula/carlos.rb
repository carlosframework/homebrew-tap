class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.9.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.9.0/carlos-darwin-arm64"
      sha256 "1952246fda0ba5e4a0a1aa84fb75c6367ca1dbd1e4d541c6bfccfe09d046be6d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.9.0/carlos-darwin-amd64"
      sha256 "bb49d3bb9355601a6f0acb4519fdecfbfdfcadc7d4d0658ee21b9a7102e02f32"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.9.0/carlos-linux-arm64"
      sha256 "956eaa24c590eacfd76b4fa7fa2eafb950e427855f457db82d0c7b2e53ab0d73"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.9.0/carlos-linux-amd64"
      sha256 "3a5f546803d8cac7689ac1ad0dc5984bf270a681af3c746ea64e94442340173a"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.9.0", shell_output("#{bin}/carlos version")
  end
end
