class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.41"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.41/carlos-darwin-arm64"
      sha256 "f5f162799adad702878254ca008817db0b565d9d9502dd0b00194eb157edf24c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.41/carlos-darwin-amd64"
      sha256 "01356d552ba48a8246847b99cfb6dd7adb918c306f6108a3bc80d6f54b26e6af"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.41/carlos-linux-arm64"
      sha256 "7486ae123636546b6f3603241a9764e4394a6bfffa8ca31f1c686b2b9419998d"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.41/carlos-linux-amd64"
      sha256 "e55af94a1c2cf4d41afcf554de8db0f2fc356187d0812629398b3ceb197d4654"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.41", shell_output("#{bin}/carlos version")
  end
end
