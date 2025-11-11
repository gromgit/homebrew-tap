class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "6f912a565ad095c3f99fced6330b522839bdb6f3e232e71b19d729b6280781b0"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "bf8f3f10c7043365f4234f3131ad91d8a16389940aa4aa51510b03fc826eb4f4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "11fea0d6bdcd337197e380cee7fed4088c1bdac34ccc9a1756809c7cc18224e1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ae1736db95c1d2c192cb8b5ce22992f7154753d355eb2318845e0a506882339b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6047399d1b954220e53b534d96fd73dab807e1d41d4df97f09c561a3126ad0e0"
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
