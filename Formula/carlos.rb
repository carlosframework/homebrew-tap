class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.36"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.36/carlos-darwin-arm64"
      sha256 "0b36fc137d5d82d32b5929aac775a2b07e3e417f47912c75c688fcb4d8e28dc2"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.36/carlos-darwin-amd64"
      sha256 "23c776ecdfadcf49d465fa0c45e794c248f8857a8238a5f867fa486322aa4412"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.36/carlos-linux-arm64"
      sha256 "0ff48a4bce7872623a497583161b9b05632eaa3a36d06b59981204db924c37cf"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.36/carlos-linux-amd64"
      sha256 "a4622340b2ee1bc043f1c44098e0108ac0b3b02ce6ced75549f075e9960718ce"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.36", shell_output("#{bin}/carlos version")
  end
end
