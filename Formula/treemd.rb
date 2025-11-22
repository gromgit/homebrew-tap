class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "4bf2d3e7eddc23a77f823ee2b6670426949c5a6e6fa155e83309a9c6db8548f4"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "e070c45313faf1cac353eb2581dbfe7603e1ee189eb60717751ee0ad28e5ea26"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cdc248ee420ec0a6ffe0bc5508347da113d221485ae521e5044e906344e3cc22"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4f3693c80031923385608a1322f621afb22a89fa4049e0c1f7be0861790521ed"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "50600728655d0365f90da54e0341c59971baddf19569417b89c7442c4f8f60dc"
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
