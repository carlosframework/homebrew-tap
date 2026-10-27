class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.29.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.29.0/carlos-darwin-arm64"
      sha256 "7ba40086fb57d164b68eedde423bfd0b1a42b90915e039f2c3795f7f33c5d5b3"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.29.0/carlos-darwin-amd64"
      sha256 "d3d7eb6a282d7dcfd753a6d5d5ec2bb2d49bdbc17a1c1c01fdd7591685cde740"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.29.0/carlos-linux-arm64"
      sha256 "d94553229a3b9e07e2b7b49e5586c4eb87de57c025914beef321056713a256b4"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.29.0/carlos-linux-amd64"
      sha256 "fa4826225616b9a4ded2674da3875079a3ad029872de963eabbffbb2a505f827"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.29.0", shell_output("#{bin}/carlos version")
  end
end
