class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "317f8d31db6a3396bc2e87c91a67ebd3b2c667189ca0efbe2f124a80b1b74955"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "7cc54560f3540b6ff9b88211372a1b04198c31709577278345e4889d00451c75"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9c71159f22107866bb3eeb45f44cf7f3ae2defea1711bf7c711d45126f43ce8f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "dd6c21fa86a80a4f644b133a24cad21343c4249bd4c30136936f1352bcda0731"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4ed4e8b766d4864036c9ff10e3095b6283e7314ef30c9bce5d22ea1215a6e90b"
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
