class MoldAi < Formula
  desc "Local AI image generation CLI"
  homepage "https://utensils.github.io/mold/"
  url "https://github.com/utensils/mold/archive/refs/tags/v0.25.0.tar.gz"
  sha256 "001ff761a9ac3c304ecb153180579ef7f84bc40de4bcc370a49bed2abfc6b09d"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7a63222670ef51b515030e78c5b09c1e60f1da2b232bdf428728337cacdcce70"
    sha256 cellar: :any,                 arm64_linux:  "07964ccfe0c507068d127a401ee44f30b1eb9e97c584167799c587d33e3d9a94"
    sha256 cellar: :any,                 x86_64_linux: "ff287eaefc2a4e8bf9199cbfb85656a1675434e56ec4eb7524ab7eed9bfc356a"
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
