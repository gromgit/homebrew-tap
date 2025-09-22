class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "52f73a7c6302c6dd5f71dbf333362aa73476093efdbdec6bba07b14a13dc3ff6"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fe2add4415be0a624a6476e74df132293b760689a24139048f69abc6db6cae32"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "14d78f381f8e33d8d0c28a2b25555c457a292cdaefb38ac6dc1bb0fa6a784255"
    sha256 cellar: :any_skip_relocation, ventura:       "02ec2679204ade115bdc7450441dc330905bb3eddaf36b524519247e78398607"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "04c8efee62174b4be90642b65aea5b6eb4d7e49de4844ccf403f2ebef29cbebb"
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
