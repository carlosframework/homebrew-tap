class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.22"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.22/carlos-darwin-arm64"
      sha256 "9cbccc9411b543a45ee20f3eb205a42ba27ee56e084ea44930ffbff0af37b77a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.22/carlos-darwin-amd64"
      sha256 "0f31516413b49704a4e1d404596ab06901bed6ea853f7ecf7053f1de4b678b30"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.22/carlos-linux-arm64"
      sha256 "1d90ff211ec9a5dff16c1d8ee44da307863e0b0623001c0bf9326454d54898ba"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.22/carlos-linux-amd64"
      sha256 "4d53793020caa36e77acc217013325046f22bc2b2c5a22c9d7b4c8b0b79c6d7c"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.22", shell_output("#{bin}/carlos version")
  end
end
