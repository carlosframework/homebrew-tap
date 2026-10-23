class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.11"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.11/carlos-darwin-arm64"
      sha256 "de4c3c8a5187d6a86d0ad401f7455770f02aef042ee007e1e219564191cdb6c2"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.11/carlos-darwin-amd64"
      sha256 "682d1a7230d76fd7302afa8794a8f6b8ee36a947110ff2727def5871ba9935ef"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.11/carlos-linux-arm64"
      sha256 "63e276690624055948c520f8af972f07317708acbdba6c364ff8d3994c5608a4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.11/carlos-linux-amd64"
      sha256 "b057bcc9737f3f8dbeed9efacfade3a1679dcdbd2716286bfbf2faddc35c7fa7"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.11", shell_output("#{bin}/carlos version")
  end
end
