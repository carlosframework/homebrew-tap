class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.4"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.4/carlos-darwin-arm64"
      sha256 "5422e3c6ce586104dfc480171db82cf7e58122b1b4d43f80e694d9051d5bbae8"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.4/carlos-darwin-amd64"
      sha256 "a459754e6ea58447e46242b1223d0efb7ed1d230499dbabe60f0b3fecac2c439"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.4/carlos-linux-arm64"
      sha256 "dea1c878cd13be573f3ba9615ae1e834b4c8d7337cbaadd78c413573e68b82a2"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.4/carlos-linux-amd64"
      sha256 "b21761b0e8bab52655b84ec5af4e265f994e8b70cf9097c9eeca9e96b21e855e"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.4", shell_output("#{bin}/carlos version")
  end
end
