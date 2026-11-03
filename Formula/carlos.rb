class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.11"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.11/carlos-darwin-arm64"
      sha256 "31692538b7697921427d2765884c99787c0c711f6d10d822b27048e17154d88f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.11/carlos-darwin-amd64"
      sha256 "51d7336d85553917ce9f3b3ce511980e7696910c4be0a46b246c2271d19dc5b9"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.11/carlos-linux-arm64"
      sha256 "c69b49f77b33c7f744418d201bb5dc1c13438e468b38737628cafe6d78cf5116"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.11/carlos-linux-amd64"
      sha256 "81b2be71cf888ed78def0efc86f348a5370f63cf32a527c7abb1c8e110e800ca"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.11", shell_output("#{bin}/carlos version")
  end
end
