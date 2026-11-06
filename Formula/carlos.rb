class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.12"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.12/carlos-darwin-arm64"
      sha256 "efdd81c1d713f386cef90db0fb525db99b5d0085f8eedd14575594805a04b0ce"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.12/carlos-darwin-amd64"
      sha256 "a82ce21c4c9333df91b1292e75c930eeecb72ac927f7289317d2b61627b03007"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.12/carlos-linux-arm64"
      sha256 "86097598c1b689c116d842e2e894847de4015e2bb3dd9f7f2966dc96b82c8ef8"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.12/carlos-linux-amd64"
      sha256 "62f2f499ca242fd7c7cb76e5af4db57042ca5e8220c320d426a8f7750e9cc7fd"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.12", shell_output("#{bin}/carlos version")
  end
end
