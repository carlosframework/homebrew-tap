class Carlos < Formula
  desc "CARLOS platform binary: edge, host agent, and operator CLI"
  homepage "https://github.com/carlosframework/releases"
  version "0.39.0"

  # carlosframework/platform (where carlos is built) is private, so this
  # formula fetches a pre-built binary from carlosframework/releases
  # instead of building from source. See that repo's README for why.
  on_macos do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.39.0/carlos-darwin-arm64"
      sha256 "4e7265ba7922bdc816a44a76228f882569600271572210b40d87db180c4b7980"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.39.0/carlos-darwin-amd64"
      sha256 "3706c067fc27ab6976aa48b7dbdaee3bbd4bb7b7c4dcff912616ccb396309bb2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/carlosframework/releases/releases/download/v0.39.0/carlos-linux-arm64"
      sha256 "dd4f71f1282bea49b21f7df5e6c2e51c7acbbd9fec3bfc1762a3d462e5e13497"
    end
    on_intel do
      url "https://github.com/carlosframework/releases/releases/download/v0.39.0/carlos-linux-amd64"
      sha256 "6808a3f8b3ca1ec450cc6f7a342836de0d899e1d05f4ae07e26ac9f1061955d9"
    end
  end

  def install
    binary = Dir["carlos-*"].first
    bin.install binary => "carlos"
    chmod 0755, bin/"carlos"
  end

  test do
    assert_match "carlos v0.39.0", shell_output("#{bin}/carlos version")
  end
end
