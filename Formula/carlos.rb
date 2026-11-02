class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.8"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.8/carlos-darwin-arm64"
      sha256 "c65fbedde94ceaf4eea173f268a35b7b01716595a4cd487687f896d948e67769"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.8/carlos-darwin-amd64"
      sha256 "c39515ad7f47d2187d7492c8d420d369db0cc3140fe0f0e23a84e87fa2ba7dc5"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.8/carlos-linux-arm64"
      sha256 "84f59fc97d452b55b0d10a639966aab4fa8f3b1e764efdba10fff41aec969f66"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.8/carlos-linux-amd64"
      sha256 "f522b32135066513f241a701c1068a6aaad36f5fff315622a0bbd9fa2707a793"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.8", shell_output("#{bin}/carlos version")
  end
end
