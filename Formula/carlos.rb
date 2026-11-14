class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.35.4"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.4/carlos-darwin-arm64"
      sha256 "6714fd0f63775590abb987dd9085f2be673dc431c211ae76a3245746be1e8ffe"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.4/carlos-darwin-amd64"
      sha256 "ef8c3bff9dd7e5316f22d8774c05e726c362631dc5c0e3b9a5276ca968e79c0c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.4/carlos-linux-arm64"
      sha256 "c1ebf0dff7831808382905f0d8456ce0fd9619afba0e30beec62a72547a6d5c4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.4/carlos-linux-amd64"
      sha256 "6cae4f83b112a78d369676c79795363f88f1b2203f1dd6a4ba4bf48ec578449e"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.35.4", shell_output("#{bin}/carlos version")
  end
end
