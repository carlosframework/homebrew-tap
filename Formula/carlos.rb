class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.25.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.25.0/carlos-darwin-arm64"
      sha256 "6b3470e82b89d96cca9b60db86dc38947b5871a7da6ec43779bd783f418bf84f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.25.0/carlos-darwin-amd64"
      sha256 "89e7c1519ab9c0bcca5f0bf9c24ab803f2f2e67ffc7b0691af5892fed082729f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.25.0/carlos-linux-arm64"
      sha256 "ff473172e1d6f5fd439a192cc9523a849a6f8a4ec37f58818d4537b8de19e08e"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.25.0/carlos-linux-amd64"
      sha256 "d68769246488b796c21e33a05929ba098e1de9dbbad2e0975b5e450aff0f9943"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.25.0", shell_output("#{bin}/carlos version")
  end
end
