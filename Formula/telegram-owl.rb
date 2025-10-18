class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v1.3.5.tar.gz"
  sha256 "cde19b1e2117663dc2294497028031f323a2d635dae582972c57ebda6c8e2c05"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d9375b3dc587d900a50063a709e5d914ecaf52e9cbf7d4c98a5760f783d24b73"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "808ce69dbed9781876b3d844a5b35f62579c1bce55751ac7d8560bdf3009a869"
    sha256 cellar: :any_skip_relocation, ventura:       "fff8dfd5ac1efd1d219a1c1aaa02c09fd45f3fac34eec400835db322de624cbf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "44a3bdfdfeec9371f1a335d5ed4e34843fa0bb18abf7a9a2134f7c1c4721fe6a"
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
