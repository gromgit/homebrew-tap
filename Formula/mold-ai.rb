class MoldAi < Formula
  desc "Local AI image generation CLI"
  homepage "https://utensils.github.io/mold/"
  url "https://github.com/utensils/mold/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "1ed26824f59e0a44ce5a8484b03e76f7ab3a944806ac39bd00450e841bfe06da"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "49a6e855f94c04a422aaa6cc16675fd89769c7acfe66a13694b96a7d69185b6b"
    sha256 cellar: :any,                 arm64_linux:  "cd925a14f567a5bbfedde4a166ec1d8259689dd4a371c639f8725495ee1ba6fc"
    sha256 cellar: :any,                 x86_64_linux: "580cac6cf3687c92707e6c33e9c2ea40f862b999d19a71d80c71bc473a7169bd"
  end

  depends_on "lld" => :build
  depends_on "rust" => :build

  def install
    args = []
    args += %w[--features metal] if OS.mac?
    system "cargo", "install", *std_cargo_args(path: "crates/mold-cli"), *args
    bin.install bin/"mold" => "mold-ai"
  end

  def caveats
    <<~EOS
      The binary is named `#{name}`.
    EOS
  end

  test do
    assert_match "mold #{version}", shell_output("#{bin}/mold-ai --version")
  end
end
