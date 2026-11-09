class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "6a65fc8a4198687c1468d004f7af77f9c34e1cfc7fc3c7de4e5fd6b4c32d5dff"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "02a402c932d4a7aa3653b4f2c54f64a7cc69e54b0d4b23444282f6490d5475ee"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:       "5742f3662e91a1f81ff756f8b70d8d184d420296efa6d5c98df0136ae4f17a53"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:     "77c4d20710ee4d27f1499d7bfe695cca8a3b90cf8b25506ba7a542e962a6339a"
    sha256 cellar: :any_skip_relocation, arm64_linux:       "d6d20e82c4b76170d0a5c2e61994d43639b4b4c958e80b8bec3691f5888d3c98"
    sha256 cellar: :any,                 x86_64_linux:      "188d28ff251d58098a65174f80d87b92c7ad0d8094ccacd8ae550057c8eac064"
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
