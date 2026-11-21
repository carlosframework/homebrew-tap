class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.42.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.42.0/carlos-darwin-arm64"
      sha256 "fdb09969e9171b82e2a1acd1088137f53caa986a3348047fd9405104e7f93798"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.42.0/carlos-darwin-amd64"
      sha256 "d9be1e4602c553212209ab7628c7cdecfec214ac370b443e211cd970eb7e7569"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.42.0/carlos-linux-arm64"
      sha256 "a82f2275d1cbdbe4f6abbfcfc99f17adfe71c7fdc506d1ec423e7e26dbd20a86"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.42.0/carlos-linux-amd64"
      sha256 "74cae3cb2c9d96888092c0250005c138119d536b2066f364c0ad4f5b8e62bf68"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.42.0", shell_output("#{bin}/carlos version")
  end
end
