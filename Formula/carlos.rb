class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.20"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.20/carlos-darwin-arm64"
      sha256 "9f8a08b45aad9ed53f794c4c2e53c114f956298a27abdcf185cfac1b0be6672c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.20/carlos-darwin-amd64"
      sha256 "503f7d8418f1ea0e64b3f2780e664e5b108ebc91d64d823e20c92c810bfa52fe"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.20/carlos-linux-arm64"
      sha256 "67e10b461df3adef385ba057425f8809b42da85a909a83b9c4d1289d2518f162"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.20/carlos-linux-amd64"
      sha256 "9a41d095b20908065426dd5596798a00a4e16632029a893965289259591b1f99"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.20", shell_output("#{bin}/carlos version")
  end
end
