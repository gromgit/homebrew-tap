class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e9d9b687df1276486f480dcd5a97ed73b53ca265fd897575069032a8d84e557c"
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
