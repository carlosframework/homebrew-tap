class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.33.5"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.5/carlos-darwin-arm64"
      sha256 "f48f5e3d53165d2905c8af5490310f071feb9e84de4e463e727ec6f414b289c3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.5/carlos-darwin-amd64"
      sha256 "0ee3f26e6287807bebd4a235aefd7b91ac008378a4c98a590ef9e28e1fd2f5dc"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.5/carlos-linux-arm64"
      sha256 "03fde535b21b3368ca0aa18502999bc6655fd0aea80246eee08ab9c0b807ad34"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.33.5/carlos-linux-amd64"
      sha256 "5171e14b4d3a6f8b43750a2c911976baa3ef09a5c154a08640aec1546d4dbeb3"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.33.5", shell_output("#{bin}/carlos version")
  end
end
