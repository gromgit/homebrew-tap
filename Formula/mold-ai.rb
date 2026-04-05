class MoldAi < Formula
  desc "Local AI image generation CLI"
  homepage "https://utensils.github.io/mold/"
  url "https://github.com/utensils/mold/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "0dfa2f9c5a7b84c6852cd9c3b6aa051e02072e921cb596952eac4433f3b06723"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "1ce53d0b75e2a097ca86a63b4c6a2d1ef458d7087e33bfc5a2123457eae62ad8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1cae360cb720a1432d9531936e6df69c0a25955c87b19d3d0e717baf42db9f52"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "62cdd351f4159ce9b539c8b57ba9b59558f01eedd8b22ac17e2e0a43aa46df3f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5d8ed6847422f833f75f90c264d1b3008cd9202beeb6f3f3b3b779818ff47869"
  end

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
