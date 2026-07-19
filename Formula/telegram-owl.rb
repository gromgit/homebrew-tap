class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "f8f6f1250d2c826d95cdfdb39611ecbabe73a5cdd993944ac6fb0d8c8045fdee"
  license "MIT"
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "99724766fb59f45affa01f27667f82d288549d1a91647c83376119bd39bf4ee0"
    sha256 cellar: :any,                 x86_64_linux: "496bf660ef4dff7e096c831785ef20d99136aa5a93d208049fdb1743b553aafd"
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
