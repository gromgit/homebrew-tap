class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "7ea812e2fa692faddd04eaf3d77fa71fea1a252374359fe9b1a88b56f075682f"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    doc.install "README.md"
  end

  test do
    assert_match "JSON output", shell_output("#{bin}/treemd -l #{doc}/README.md")
  end
end
