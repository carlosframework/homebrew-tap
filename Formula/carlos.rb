class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.10"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.10/carlos-darwin-arm64"
      sha256 "f50f4da5f2c514bb5571a33aeaf0847b3b6bd15f35b0a6952d7097a44a92e23b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.10/carlos-darwin-amd64"
      sha256 "1f6af6aa1bd9ef850bf7ed4d2808a37cb017022326e3bda95934ff084092f0a5"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.10/carlos-linux-arm64"
      sha256 "a8776dc6955ccec461b0665af9e11377d855f086dcfda6882bcd9822f0342a14"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.10/carlos-linux-amd64"
      sha256 "e90a165aebc98d4f4df21f6b50a63a5d1b26e3e4a3508540775cb4a795cc5bfa"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.10", shell_output("#{bin}/carlos version")
  end
end
