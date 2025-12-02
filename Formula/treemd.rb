class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "3a1934043642dc2751e802dc66ecdc435d649a9eea22a0b674eaf43d14968849"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "8f6d856d0eb62957cbccebabb08f24c50ffd72a7f070aa0e373f9ddf73540c8f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8d11f0a94067f07164f3520cc72a739477488c5b6e02f47dfb44c0dcb765f0bc"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "02f2a2f2ec61d5b4a21c8ec41607705f5d95d395f7f60e3a8958dbf88bc2d441"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2f3523f8b6f24cc5255c2c6dc3b4139bb7c94838b40187fe5094e94c1233aed4"
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
