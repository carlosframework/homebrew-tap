class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.0/carlos-darwin-arm64"
      sha256 "acc24710c3e7a2530c433cd18ad3c517fe5fd4939fbbd6dc05d9609256c6a8ce"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.0/carlos-darwin-amd64"
      sha256 "81bdffee7aca0239f27d54e192d16dad0600674a65b8e5e3a11067d01b9ac1d8"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.0/carlos-linux-arm64"
      sha256 "fecbe64347fa88dda1f5e237df8df12cab601bb77d37437961731f9602a312ab"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.0/carlos-linux-amd64"
      sha256 "becbe47e38d0af18ae0c41bb1ce3d8f9e1e0f7eeb674e4109a7f52becb42dac3"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.0", shell_output("#{bin}/carlos version")
  end
end
