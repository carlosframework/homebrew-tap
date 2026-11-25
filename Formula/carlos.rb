class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.8"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.8/carlos-darwin-arm64"
      sha256 "bae223df1ab6dad7325f630045fa0518b6078c618cee4dd2bb004b66709467f0"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.8/carlos-darwin-amd64"
      sha256 "ed86cb0e7de430b9904dc13349718205948c5f1dabc04480fd3442641845ede8"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.8/carlos-linux-arm64"
      sha256 "11b2a54d11610af75bfbcf6c394261f47afdd598c9476c4a3d1e47bf07f0f53e"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.8/carlos-linux-amd64"
      sha256 "93687511e7590bd938d80118ca947be1c5eeef53bd6d515f9582c5f3acb7152e"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.8", shell_output("#{bin}/carlos version")
  end
end
