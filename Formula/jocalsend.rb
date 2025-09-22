class Jocalsend < Formula
  desc "TUI LocalSend implementation"
  homepage "https://git.kittencollective.com/nebkor/joecalsend"
  url "https://git.kittencollective.com/nebkor/joecalsend/archive/1.618033988.tar.gz"
  sha256 "0a3050d79ff143af06188cb68da93fa431e4f2447714a378a801b79304f03b93"
  license :cannot_represent

  livecheck do
    url "https://git.kittencollective.com/nebkor/joecalsend.git"
  end

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3369d81c01e430f72e3249b0e8581fd889e64ec79ea352e7a3ca18210e2eb97a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e9a27fa749303c6f71b3bad710cde5ab88ecca2cd4921ea32316f1ab7aade753"
    sha256 cellar: :any_skip_relocation, ventura:       "1de30fb9a7ede1d0f050588ea84313acb91b29b438b07164823fa6f7ecdae37a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8a2d8f7f4b8576a4305aaadd19fe52b62e4e57f2587b371a84878d3aaeebe997"
  end

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      License is incompatible with Homebrew core:
        https://git.kittencollective.com/nebkor/joecalsend/raw/commit/b4f22c5851593ebc868ea1e85128f2e3cd45163d/LICENSE.md
    EOS
  end

  test do
    require "pty"
    require "io/console"
    require "expect"

    PTY.spawn(bin/"jocalsend") do |r, w, pid|
      r.winsize = [80, 130]
      refute_nil r.expect("Incoming Transfer", 5), "Expected Incoming Transfer Request header"
      w.write "q"
      r.read
    rescue Errno::EIO
      # GNU/Linux raises EIO when read is done on closed pty
    ensure
      r.close
      w.close
      Process.wait(pid)
    end
  end
end
