class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.5"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.5/carlos-darwin-arm64"
      sha256 "2ec78ac6428a11a4f5f16408cd1089b3528ad0987288b76c36a616169d9ee141"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.5/carlos-darwin-amd64"
      sha256 "49e436eed788c082a6e5fe9d687828ffc7834236ebfd87341da65f3899b37061"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.5/carlos-linux-arm64"
      sha256 "fcb2b624db0f76247c89b1df8ea907a89474d1fa6225416a808f18ec53b4e155"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.5/carlos-linux-amd64"
      sha256 "606148b7e3918e443433b62e04e1ce6ffb5ec2883b276232d41906e36a736d67"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.5", shell_output("#{bin}/carlos version")
  end
end
