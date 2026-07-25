class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "a9e0de4628763bbfbed2b0a47015fc2f6d20d238cae9a4088e6d11ddd425cb8e"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a0ae8b6ffc679e68252a77c01e6ae06cec6e6faa7cad2f946388cd936a95ed25"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "6b1b78dd24927979133bcf379bd012f39c17efb32456b3047b09ffcf49855394"
    sha256 cellar: :any,                 x86_64_linux: "be326c42e133bb50452964bfe2610ea9f5b40ab3d53a689a4d89fdf1bf3f63df"
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
