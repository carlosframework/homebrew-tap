class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.42"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.42/carlos-darwin-arm64"
      sha256 "edb5ec59484a452b11420bc4e362119df5bc4654d874c4d96cfb44a99bb9f04f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.42/carlos-darwin-amd64"
      sha256 "38ff339f0f7d0768cf196f162add92ed9c2a73614db9110a84dee64af0b7dda7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.42/carlos-linux-arm64"
      sha256 "ce88eca60d729b7f6ab54ba632d5dc3d3ee9f6878b45e324602a64a823a419e6"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.42/carlos-linux-amd64"
      sha256 "4055730b5be6493cc8a68c9be035945bcb8e3ada5a08aca40760f6442de8028e"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.42", shell_output("#{bin}/carlos version")
  end
end
