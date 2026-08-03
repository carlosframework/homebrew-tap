class Rastrillo < Formula
  desc "CARLOS web framework CLI: scaffold and generate routing for CARLOS apps"
  homepage "https://github.com/carlosframework/rastrillo"
  url "https://github.com/carlosframework/rastrillo/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "3d61de44196e516635afc7b046474189cd49c0119df6fd6eb3c6ab02040db777"
  head "https://github.com/carlosframework/rastrillo.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/carlosframework/rastrillo.BuildVersion=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/rastrillo"
  end

  test do
    # `rastrillo` with no subcommand prints usage and exits 2 — verified
    # against the actual built binary, not assumed.
    assert_match "rastrillo", shell_output("#{bin}/rastrillo 2>&1", 2)
  end
end
