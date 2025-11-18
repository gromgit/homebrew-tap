class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "317f8d31db6a3396bc2e87c91a67ebd3b2c667189ca0efbe2f124a80b1b74955"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "9153d295be4cc5429ea5c102fd675237e43f6797afbb377258a58e7f66d51cee"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ba488b74127a4af4d496b96efaa433140ea2ad73bb1e1ad49caa167ccbf28489"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "92c1fd9c369c88c9d7f21913f38c3d91c136c8e48a3eb13ac57715176fd4c20d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "580eb9fa93df2a98212cb245a9bdf7a640dfd2be19c12b2919e27eb7f5b3fad7"
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
