class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.20.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.20.0/carlos-darwin-arm64"
      sha256 "369811626516bdf3a3c8992fd0ffae59e092aa4eb66c40fd4c129a7fdbef8cd4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.20.0/carlos-darwin-amd64"
      sha256 "1bb152500953a4a4e8b7427fe2346ec28d90259fa797f04ded4e8d291febe7ba"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.20.0/carlos-linux-arm64"
      sha256 "fe340e78a1cc719da9cfa3622dc26bde9e9d8a35ac521d8e3a3e6569d7128e8b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.20.0/carlos-linux-amd64"
      sha256 "5a44e194b273b1017afeef27493c8a233611d5fa79cfb4618be87b7d476ed901"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.20.0", shell_output("#{bin}/carlos version")
  end
end
