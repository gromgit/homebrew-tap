class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "e771b2cc34e739b968da99db576dc157214c075fcd7580cbfc1ba193fa9c2c02"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5fe4e6bf4103d7d0af0259bbe80b5e4f9ef0003d9017333da820d5af6a2df7ff"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0b2b47ff4ef70ab3634c19ae166d3f351baedb6b1f874f776d15c5bb74e4b358"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6e13db8a7c93902f294e0ab88ae0e1522dd4a7243bda7c21196e55696f62ec9b"
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
