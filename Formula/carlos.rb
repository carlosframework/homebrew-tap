class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.34.38"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.38/carlos-darwin-arm64"
      sha256 "9210c6a0b1c15d8d8c6d29d0f4952df73bc6050331ea6a9323db90160a97c9f1"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.38/carlos-darwin-amd64"
      sha256 "71609ea73d76bf2e7e818ead329579eeab417b4459fe1e66cdc4382ed3dcf63d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.38/carlos-linux-arm64"
      sha256 "3aef60c1aa3cf54f3a28e902380be23923f40f29d80c14847f23eca3fd077582"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.34.38/carlos-linux-amd64"
      sha256 "aee3f3d56e76e3789d21aa3edc8282c02a16df36e500448ef28689915ef7f337"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.34.38", shell_output("#{bin}/carlos version")
  end
end
