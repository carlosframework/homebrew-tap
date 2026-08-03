class Rastrillo < Formula
  desc "CARLOS web framework CLI: scaffold and generate routing for CARLOS apps"
  homepage "https://github.com/carlosframework/rastrillo"
  url "https://github.com/carlosframework/rastrillo/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "79c84e093c7c33d7b3e7ae0664b856b5b25212b523e864bd9d37ea1503ecb4ca"
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
