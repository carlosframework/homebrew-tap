class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.40"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.40/carlos-darwin-arm64"
      sha256 "93c7e68d58c4473d4f0c53b9177eb77c33293ddab3f1e45d3e98197e9db03c6b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.40/carlos-darwin-amd64"
      sha256 "5814eea4acc89c6339e3d7d5057113ca494c65b3e935e6d18ed86356c4359f4a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.40/carlos-linux-arm64"
      sha256 "bc6ef21f0d45d5c5bf87b373d5776927c4b2c6c0ec5f70187bf7dddd4dc8f5a9"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.40/carlos-linux-amd64"
      sha256 "1445dd831121c20f67db6ab7bed44aa0ecdd8673f23c06a4e678048fc0590f42"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.40", shell_output("#{bin}/carlos version")
  end
end
