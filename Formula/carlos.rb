class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.43"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.43/carlos-darwin-arm64"
      sha256 "5e1f47ca54d03552a391486f82209eb36d89db1d89dee3bb23313f746a57240a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.43/carlos-darwin-amd64"
      sha256 "08673ae9af9e3d654174c478583d1cb4785b30e3d5c85f866203f33c16d7a7dd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.43/carlos-linux-arm64"
      sha256 "37d490e2fdc7aec37bc7f74a505c619bfb8f85a2b97f91677b601f999da2a165"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.43/carlos-linux-amd64"
      sha256 "79819ffe7c1a0bf447f15ddc1a0613c96fafcf457a76dabae565a444e9c5a18a"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.43", shell_output("#{bin}/carlos version")
  end
end
