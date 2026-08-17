class MoldAi < Formula
  desc "Local AI image generation CLI"
  homepage "https://utensils.github.io/mold/"
  url "https://github.com/utensils/mold/archive/refs/tags/v0.23.0.tar.gz"
  sha256 "6124f8db2650b4047da1594f128ac1296b50a7e3fc29d313dec325173476148c"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2d4a06843a9e7af6bbfb492769c1e18759a51e7c9eed23043b9295cb5b10b29c"
    sha256 cellar: :any,                 arm64_linux:  "354d4074c6e32d5111953fb3c0a3d25d5ea34c0b21cf55dc625315904bb2120f"
    sha256 cellar: :any,                 x86_64_linux: "cb14df2abdd6586a146bf10f79732f2a43d024e3f67330ec80af522c01e1e2b0"
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
