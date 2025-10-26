class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v1.3.6.tar.gz"
  sha256 "2ade953ef90ccb44b3cd0ef521ab3d1926e531c419020ef447d2ff231f13ad5d"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8254405e607c11e9b49b2b147b30c80af8fba5fd8a45ba8074d1e66b606f4ae1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "c9a3ea18caca6f4d72600ab3fc40fffb4b4cfbace6c1eafb2b27eb113f955539"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a7406926cfccae8b7eab5dcf81545a2a956bb2e570e0f122753fdfde9b4d31a9"
  end

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/beeyev/telegram-owl/internal/version.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/telegram-owl"
    doc.install "README.md", Dir["docs/*"]
  end

  test do
    assert_match "failed to send",
shell_output("#{bin}/telegram-owl -t NON_TOKEN -c @non_channel -m 'test msg' 2>&1", 1)
  end
end
