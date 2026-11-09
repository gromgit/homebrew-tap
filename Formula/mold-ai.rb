class MoldAi < Formula
  desc "Local AI image generation CLI"
  homepage "https://utensils.github.io/mold/"
  url "https://github.com/utensils/mold/archive/refs/tags/v0.37.0.tar.gz"
  sha256 "56265f01ce9379ca0b2eb3cd3172ad2b83e20a19a5d0fa04d656f2cc96ec7ab5"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "439120358d58515ff1f4fca5bd035a1006116dcaf89bf8a5ba36f5adcad7dd9f"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:       "526e06753bfaefd11cdef22e33faf5c8a80a9bd28d3796574926fff9f7f62dc8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:     "8501d7b617761bfcc3fd21ee409d4f0ec5f2581c1f755ad44b0424dd82b1cdd6"
    sha256 cellar: :any,                 arm64_linux:       "2bf543d2ee634cf64bda57538b2f2f46d1acccf6d3ad0605f2a1e48fe35a0bae"
    sha256 cellar: :any,                 x86_64_linux:      "d8e4e1cb280a3d8f1ddd6d33b70df5dcbc76aa74e9fc8f22b18455f1f3070ae8"
  end

  depends_on "lld" => :build
  depends_on "rust" => :build

  def install
    args = []
    args += %w[--features metal] if OS.mac?
    system "cargo", "install", *std_cargo_args(path: "crates/mold-cli"), *args
    bin.install bin/"mold" => "mold-ai"
  end

  def caveats
    <<~EOS
      The binary is named `#{name}`.
    EOS
  end

  test do
    assert_match "mold #{version}", shell_output("#{bin}/mold-ai --version")
  end
end
