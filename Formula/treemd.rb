class Treemd < Formula
  desc "TUI/CLI markdown viewer with tree-based structural navigation"
  homepage "https://github.com/Epistates/treemd"
  url "https://github.com/Epistates/treemd/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "4bf2d3e7eddc23a77f823ee2b6670426949c5a6e6fa155e83309a9c6db8548f4"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "31c6746b7a802af2775c0b0cf963673bd694e9aa857a78bb81f754237f1dc8c6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e0c1c3b47d305177dda4d5ce51cf3bce0b4bd2952a1a703fb951fb874aafd92f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ede0b6b18da3500557bba4d677f2e29a4ec7c746ed97d28daddc909fcc3f0430"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8db4fa7e473025f02dd346d3d35a8831a92d5bfcd415e19ad84255e22748f9f2"
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
