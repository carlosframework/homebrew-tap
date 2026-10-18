class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.2/carlos-darwin-arm64"
      sha256 "e4c48e721a9ed95f663c1a7b865f28f78b902152eba308d9b4249592c19792c4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.2/carlos-darwin-amd64"
      sha256 "d3ba0378d34bf852fafbf48afb69f4a2dedc0fb9f263aa90e5d69f3ada4e96ee"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.2/carlos-linux-arm64"
      sha256 "7141e037d61b0d95ae554252af1bb9155653a9954ad0dcaffb35c7047850f492"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.2/carlos-linux-amd64"
      sha256 "303f6522ac3a03529c3d08b0e1cd2751d94c68293355db3ed67c1a5b9049a808"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.2", shell_output("#{bin}/carlos version")
  end
end
