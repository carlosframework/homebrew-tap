class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.31.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.1/carlos-darwin-arm64"
      sha256 "abb7dea83f7885ed11ee38dc25079c8acaf8254e0290b0db554475cbe8a624c6"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.1/carlos-darwin-amd64"
      sha256 "c87c7c5455aca45177578a0214bdcf1688eac5a5426ef3a56d41343760c41149"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.1/carlos-linux-arm64"
      sha256 "7021a2f2c443b25c80ce285c5c2371b3b731ca32b659f4c01867e46ef9747ad4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.31.1/carlos-linux-amd64"
      sha256 "4dced12058358d7674cc0eed30aad2bb2730d462b5e0e9a98b24780e1544558d"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.31.1", shell_output("#{bin}/carlos version")
  end
end
