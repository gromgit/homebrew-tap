class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "e771b2cc34e739b968da99db576dc157214c075fcd7580cbfc1ba193fa9c2c02"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "852807482821b5e68a7cf46f1887e3c575f45666c7c01747cab3659bdecab113"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "691dd06f7c84340f5bbc32002f58d93726830952eb4848d0564837d1206b6cb9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6cd2311c3c896da9eed122980c6a296f177822fc9272fb2a6f531d9555c4f26c"
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
