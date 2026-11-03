class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.9"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.9/carlos-darwin-arm64"
      sha256 "9f70ecc9951b8476648f6d66104dbcf08eee84cbb87ec0c97161cfc9ca043a29"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.9/carlos-darwin-amd64"
      sha256 "9086795bd6ef8c9333648c9c51d0db53c1208bf070fc81a763667c8e5fa9ea61"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.9/carlos-linux-arm64"
      sha256 "714ec063e1a9f5a46f58716b3424bf243f4ddd2f39a4ee11a649b265f512126e"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.9/carlos-linux-amd64"
      sha256 "34efa0da826f78053c1f006d3c8aad4d38fede81ebc30fe39af1b7cfedf06d70"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.9", shell_output("#{bin}/carlos version")
  end
end
