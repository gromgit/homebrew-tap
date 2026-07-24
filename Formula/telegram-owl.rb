class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "a9e0de4628763bbfbed2b0a47015fc2f6d20d238cae9a4088e6d11ddd425cb8e"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "79c38ed6938b9f6fe327a71601d116f7d08d1b472b265f08e69e097a3d26e902"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "4514eef1b8344bfaa6a4de463a5abbde4259e82398acc88490485411e54ab199"
    sha256 cellar: :any,                 x86_64_linux: "c160973926b8591f3724826ccdc6bf1bf56a9fc179d2754abe8987a5ddcc6ad5"
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
