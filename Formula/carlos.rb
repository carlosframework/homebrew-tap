class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.8"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.8/carlos-darwin-arm64"
      sha256 "d6164ebf91dabcb13c9b5a7e4177fbbd1e6ece9530eeeb42e307bd6689744e04"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.8/carlos-darwin-amd64"
      sha256 "203da96d3a2b0af05038da378d3ae350f9f3aebfc6cc00ac6dedd4af979a3bd2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.8/carlos-linux-arm64"
      sha256 "57e0c71c8b3bbc5b28c35553b1e9373224c459c7da3104ed2c56a3501ccf08ce"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.8/carlos-linux-amd64"
      sha256 "c96813b182e509ff5f4b9855abbe76e7829710a9de10332513ef411ff7f8ad34"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.8", shell_output("#{bin}/carlos version")
  end
end
