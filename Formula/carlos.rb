class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.7"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.7/carlos-darwin-arm64"
      sha256 "e4e3ed7f8fd212d686b24f6cadbaec9d8a29970d7e8c9272af2a84cadae675b1"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.7/carlos-darwin-amd64"
      sha256 "1a1d86d3e5dd3db60381c6f867aef4c14db53a1fd43c927c9296b9e023acdcf6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.7/carlos-linux-arm64"
      sha256 "fd339145958e0a1df33e1210280ba25b2e4c35b687ca01e52b7704c6953e135a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.7/carlos-linux-amd64"
      sha256 "a16caff067ef11d72dff8d5588974ad66754fdcae22e1186dfba241a3a994755"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.7", shell_output("#{bin}/carlos version")
  end
end
