class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "24ece52c14437dd9d4b694022326b69c511f107ee0ad168bd5e7d366d8f10aa7"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "460c49bcaed73c75bc3a7ca841759ba5b6095e5f1b95ddff7028f1890aec096a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5f4853881a93492a4fc5cc1a1d9bf2c1fa4b6c46b78cccb18e3f2dd177da1a43"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "332d30103c7e2744bfab84acea4d258e6a4f70e4893db0725a0cb3699fb4dc10"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2471953e8eb3e3ec0bf801e9ad564997353a309e3ec664daefbe2888febe7a56"
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
