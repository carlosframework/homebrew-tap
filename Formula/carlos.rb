class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.40.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.2/carlos-darwin-arm64"
      sha256 "2a41540ecc6473d65a661c1962deacdbf685dfda25315337bb802f476e46c3b7"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.2/carlos-darwin-amd64"
      sha256 "c304d6378ce09a6cabb9018c97285bfb17ac41e6347cdf8d3f40de4f97a4edfe"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.2/carlos-linux-arm64"
      sha256 "17f03d69254fd5bbfd932bf9bc8a7bf8286fbf9a5a94f51f90a1ecbb0dac266c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.40.2/carlos-linux-amd64"
      sha256 "515176a12a425f0b5a3e62ffbb07919129c5c779394a7733b43b3dac5414f8ef"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.40.2", shell_output("#{bin}/carlos version")
  end
end
