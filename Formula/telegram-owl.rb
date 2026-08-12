class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v2.1.2.tar.gz"
  sha256 "8b4a6812ff60f6eb0a82dd5ff1530cf7bfc3ba66ddf63058eb706b72cd0ac226"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c64299ca3ef6fcf3d637ed2d5e9813543c56cf29c60a74e4751db4ab626bf861"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "a1fe634501a811406477484ca17f3eb3f8fcb601814178d5c1463cd4f9a33ac2"
    sha256 cellar: :any,                 x86_64_linux: "a09f1abb89ad4848b1444863ff23bc27bbaff815dd1a1f0dd07068b50a8020ba"
  end

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/beeyev/telegram-owl/internal/version.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/telegram-owl"
    doc.install "README.md", Dir["docs/*"]
  end

  test do
    assert_match "telegram-owl v#{version}", shell_output("#{bin}/telegram-owl --version")
    assert_match "failed to send",
                 shell_output("#{bin}/telegram-owl -t NON_TOKEN -c @non_channel -m 'test msg' 2>&1", 1)
  end
end
