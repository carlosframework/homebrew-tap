class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.43.2"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.2/carlos-darwin-arm64"
      sha256 "b4995599bffd1dea385d8200aa1334172a0700032fe9ac480cb0bf12f4041383"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.2/carlos-darwin-amd64"
      sha256 "d7b9ba7a648f0ef381f405af959005bbd448098356898796452f9f5a291ce92f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.2/carlos-linux-arm64"
      sha256 "fe6ec1696ae3cf0fb0182db3b1324b727fb600083d920caee7e08dccb117dc3f"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.43.2/carlos-linux-amd64"
      sha256 "faea7dacf453d2b1774264714f159d3cf14a295cbe312a58d95ff1242c06196b"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.43.2", shell_output("#{bin}/carlos version")
  end
end
