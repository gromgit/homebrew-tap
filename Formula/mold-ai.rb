class MoldAi < Formula
  desc "Local AI image generation CLI"
  homepage "https://utensils.github.io/mold/"
  url "https://github.com/utensils/mold/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "0dfa2f9c5a7b84c6852cd9c3b6aa051e02072e921cb596952eac4433f3b06723"
  license "MIT"

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
