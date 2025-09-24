class TelegramOwl < Formula
  desc "Lightweight Telegram CLI utility"
  homepage "https://github.com/beeyev/telegram-owl"
  url "https://github.com/beeyev/telegram-owl/archive/refs/tags/v1.3.3.tar.gz"
  sha256 "169cf9a32697cae3d8183a584cbac546a9d47b7bab0bc72f3292860f12be8202"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e38a0ed5b1155f3ab7942b1e36267c75adb51e2c82664e20e7572115e2f169ab"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "f2888167233a1b54f7b435faa3c023edc603270a4d59d82bfe21a6f43020c543"
    sha256 cellar: :any_skip_relocation, ventura:       "0afbb93197cc7826a34726c30dc6d0600103baaff1f873eff8e266f88a7c531b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f5453cc3bb60fa0258c119950914bb7b0ce85d22eca58ce12bc2b478d3e1d581"
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
