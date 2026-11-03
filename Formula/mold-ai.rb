class MoldAi < Formula
  desc "Local AI image generation CLI"
  homepage "https://utensils.github.io/mold/"
  url "https://github.com/utensils/mold/archive/refs/tags/v0.37.0.tar.gz"
  sha256 "56265f01ce9379ca0b2eb3cd3172ad2b83e20a19a5d0fa04d656f2cc96ec7ab5"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d7d6a8ab36405bc4202877c1e3875278c0fd87df68176612c84dab9a910ed947"
    sha256 cellar: :any,                 arm64_linux:  "e73e0794f1b912c8b5faa7f2e86003581b7fb75e620c704976df23483514c953"
    sha256 cellar: :any,                 x86_64_linux: "30c361ff4abf5c4d81e19d924d924538b775d61a56142cd30f38f99305478d2b"
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
