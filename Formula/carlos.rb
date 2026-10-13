class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.26.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.26.0/carlos-darwin-arm64"
      sha256 "701545d5798d4e29f0d3334142c74e44c244e9e7b6398ede4c8653f3c6e540d6"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.26.0/carlos-darwin-amd64"
      sha256 "3dd0768d05f8d09b011cc28aa2eed0fcafbb3b1c6270e4ec8b2c83c8db5bce02"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.26.0/carlos-linux-arm64"
      sha256 "1b3405414605649ef53a6357f6dada276294afbc344708e368a2fd233cac5a76"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.26.0/carlos-linux-amd64"
      sha256 "60c14b6c396996dd64887cb740a3174577e87c45ccb5567821305c418dbcbaa0"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.26.0", shell_output("#{bin}/carlos version")
  end
end
