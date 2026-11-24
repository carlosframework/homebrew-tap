class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.3"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.3/carlos-darwin-arm64"
      sha256 "2d8561062495b26493fbd70c6389aad84115fd5d896b87a993b8562556b5536b"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.3/carlos-darwin-amd64"
      sha256 "b4f119def759bf2fbea03741934a6a0fd8d9d5e10b462b11ce843e5c03f94ff3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.3/carlos-linux-arm64"
      sha256 "3ba48a4f36f1063fa4677f6989e8fe4dcb3a303f4fa74cef285e0de49fd88e53"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.3/carlos-linux-amd64"
      sha256 "1df361f432a2f71582afd639f0e9570a41d5b4a02eaa60c1ea5a066dce184666"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.3", shell_output("#{bin}/carlos version")
  end
end
