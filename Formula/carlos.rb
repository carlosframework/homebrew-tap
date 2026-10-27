class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.28"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.28/carlos-darwin-arm64"
      sha256 "cea2fe06f25cc877ef45712f5719d76427514b752f0894cedbfb4f0e517d143b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.28/carlos-darwin-amd64"
      sha256 "0426ff9d1bd27f3369f4e7e13de43be6f2169d86ed9f9c2e7fa43be75631bc40"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.28/carlos-linux-arm64"
      sha256 "081f0bba913b30146615c3cd33b539edd0cc44a2832e45f94e19af5b9fe51311"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.28/carlos-linux-amd64"
      sha256 "e63c64f2d02ae57c4ed986557243d952c48087eadebb3d80b4bd7ffe93b8b196"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.28", shell_output("#{bin}/carlos version")
  end
end
