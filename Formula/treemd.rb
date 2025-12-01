class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "247ce8c257403eacd54b47d90dac8e05f126674569a6d63984ae11aab43048f4"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "095e0e328c7db5069d1556d24a0e8fec2dfc0787c5ad1002786af4c0948f3ff5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c48441f552c5289a1bab58280d50a9a157fcd332ff18fefc850ab5bbaf03ad99"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9fa4167969cd8bd6631ae327de72cccf18b7ccc3de61ff32d140b8da17aca678"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "68816eff13983f350d7b35663eb8ee23ec2cf7f2530bdafa40142601e53045e2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    doc.install "README.md"
  end

  test do
    assert_match "JSON output", shell_output("#{bin}/treemd -l #{doc}/README.md")
  end
end
