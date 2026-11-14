class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.35.1"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.1/carlos-darwin-arm64"
      sha256 "e9adadc1f3e8ee7d42df4efc8650e902580ec651efdbad39b697e57850c000c2"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.1/carlos-darwin-amd64"
      sha256 "58be4ef3321bcf5a06643dd0a7f55ca4dacc2554eeb0cbc6bd4bd63e3a68beb0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.1/carlos-linux-arm64"
      sha256 "32573e64c57c1273046f25177459ff47cab59dfdd0d8a62eb362c4c9d9f54981"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.35.1/carlos-linux-amd64"
      sha256 "2fe575833d1d652382d6775b2e095a65c18b557c24114791b4726a29c67dee63"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.35.1", shell_output("#{bin}/carlos version")
  end
end
