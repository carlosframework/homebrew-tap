class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.13"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.13/carlos-darwin-arm64"
      sha256 "5a4761ef97f9f7d394787de566d774a799e990ae50ab9a1eac58c03d16ec184f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.13/carlos-darwin-amd64"
      sha256 "983c011f8fc363d8877e2e0067487799ec8175e3c16bae8a07ef73def43a229f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.13/carlos-linux-arm64"
      sha256 "f0f00eed105d8a9a41af4e363e824782fbb1dead22819c7368e26bfbe9e9796c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.13/carlos-linux-amd64"
      sha256 "d177eaeaf0531b7223aa0783a4147f04388d36a445a4c113d67d8264f54dbefb"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.13", shell_output("#{bin}/carlos version")
  end
end
