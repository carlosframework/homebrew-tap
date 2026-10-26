class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.24"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.24/carlos-darwin-arm64"
      sha256 "a765ac37ce77487002a2810d405ba1ceb9d9123e939aeb7c3dd75f90a5a472fc"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.24/carlos-darwin-amd64"
      sha256 "15a20411150ce19150fae70c7246253907c8ce7dda79f940fe2368b7b86fb205"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.24/carlos-linux-arm64"
      sha256 "abef5bfacfab485ed3a0d5719eebf6c0b1112d5f58a54d696cd0ce843f10a5d1"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.24/carlos-linux-amd64"
      sha256 "6e647fde1e3497b708ba51f160ae37d1235b2959d20e723beaaf1f282429e08a"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.24", shell_output("#{bin}/carlos version")
  end
end
