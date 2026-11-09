class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.32"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.32/carlos-darwin-arm64"
      sha256 "4829ac629e7ab8d9d218881dc8b2976ec89dafa1b723aa36b4e0a44b4114724a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.32/carlos-darwin-amd64"
      sha256 "66f2d36b6f894515f56fbbf860765e01c5e62104482d75f515551d6d1c8004d0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.32/carlos-linux-arm64"
      sha256 "e0c2a1a7a57a62cc42ac13b9e32968eab16f7b8732c33aba470633c572467b22"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.32/carlos-linux-amd64"
      sha256 "17f3238b22f4524b46e9536e794222c93855bdd8a160b919f7578ddd7c682b3a"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.32", shell_output("#{bin}/carlos version")
  end
end
