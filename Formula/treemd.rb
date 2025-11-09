class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "337536b1951cbeb93b010c0211480b398abc2bbb03fe91e2d51bd0f357dd0d17"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "f7d270faa6a19e11828eeb218dc878ad72f3468543234cea01e55b6434efbfa4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f2e124fbd0d42b9a23b64a4b41989cbf68f33c1df162cc8aff2b4f59b3903d6c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ef012e30de93b0102629201e1dfd1b290723381aa88d29f9d4cc4a0198d3c0b7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "34dae004e8bb6a1d459075495c4c368893f8568171076fe1a2e8ec98c7d951b9"
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
