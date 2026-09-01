class MoldAi < Formula
  desc "Local AI image generation CLI"
  homepage "https://utensils.github.io/mold/"
  url "https://github.com/utensils/mold/archive/refs/tags/v0.26.0.tar.gz"
  sha256 "88cf655feedd4804398e59a1eced7da2bc09fd58b00ca6fde0b5b1d5a11fa777"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "aab46ae961e2f13aaa3ff32db98025800cde952225514110480977b2fc8ec69a"
    sha256 cellar: :any,                 arm64_linux:  "d23c7bc904f952fb991ba55c9c5b530b3d34bd814f627335a4cda517681f8c16"
    sha256 cellar: :any,                 x86_64_linux: "b883ac0a90aff966e89fdf6a98e7d9b61ed1bf5d90cd60c210a798a525b131b0"
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
