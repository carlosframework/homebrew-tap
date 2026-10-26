class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.28.21"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.21/carlos-darwin-arm64"
      sha256 "2d55dcf4a3cdef187404491c3fb8bcca70d0728d9bc194ae81a1001b5f93715c"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.21/carlos-darwin-amd64"
      sha256 "0fa8e570ca7dce0e24cbb0b54b94af34822a7323910dd1cf07869831ee4d9a72"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.21/carlos-linux-arm64"
      sha256 "a91e45ffe393c28801a736d54fc4329d679e083e0e1227bb5b927e7d213d936a"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.28.21/carlos-linux-amd64"
      sha256 "14da056d10ca469c3ede9fa44e0abcb653d8d813577c25d726cd3863ce302764"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.28.21", shell_output("#{bin}/carlos version")
  end
end
