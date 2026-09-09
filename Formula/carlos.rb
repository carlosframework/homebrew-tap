class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.18.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.18.0/carlos-darwin-arm64"
      sha256 "c329ab9dca82f9d4c9ad69aff31db278e2f85407c55ea455af67c47f0c05e4fb"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.18.0/carlos-darwin-amd64"
      sha256 "70869a9163bd7626764d1a001ee35a57d897a5ac5c6f3d0f3877588e9e520488"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.18.0/carlos-linux-arm64"
      sha256 "e4beeae5cd71e55818ba0c797ff9050453887c91f313ddac250ec23a523e0632"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.18.0/carlos-linux-amd64"
      sha256 "5130bdca57c9b9e7c9c8c37c251fb6670203966c8af9dfee27e2ffefaff0e30c"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.18.0", shell_output("#{bin}/carlos version")
  end
end
