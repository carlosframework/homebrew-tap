class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.27.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.2/carlos-darwin-arm64"
      sha256 "3afa9eb74df091e443a5db00c12d2964fdb6fd21b702fcedba6051c1ecdd1705"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.2/carlos-darwin-amd64"
      sha256 "35a8f09b3ca04312b99a94c9b2f4ce80ede81078ccc65c59ed08f0cf1ae925a6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.2/carlos-linux-arm64"
      sha256 "409dc75b6ae2f0f37400ba86205fe0349d75acb2db39df5709c695e1db22719e"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.27.2/carlos-linux-amd64"
      sha256 "c38a2870032e722d7b079032dea142fd96c1d0f32b4ddd5554cfe2fafc388060"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.27.2", shell_output("#{bin}/carlos version")
  end
end
