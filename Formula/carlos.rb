class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.6"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.6/carlos-darwin-arm64"
      sha256 "6e98a3dbac16593348bbcb90a455f7b9d32f7191db240dc26536ea1390f5463b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.6/carlos-darwin-amd64"
      sha256 "c3a8e804faf0f0d83e1afda74dedb32c9b5ab56b2bc3abc48d67de4c8d74a7e9"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.6/carlos-linux-arm64"
      sha256 "45341fac6816bc77a92eedf2cd85bcd7d16e5b81cf4d9567a695ceaff91cbc30"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.6/carlos-linux-amd64"
      sha256 "27cd4ad066bef4ed886d73baabff1e6a7aeeba27f42d218ec49f643cec04f246"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.6", shell_output("#{bin}/carlos version")
  end
end
