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
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8dd093f59b3c4c9cd9c0db569639be2c68e8d37e9c51de2b9b8f5a87e3c62334"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "7ec433fef7ea4209973641f924d2d18d5a76e96ec2e3b0b2957386729a292d9f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c30eb68937f68ae2697254f03d43b390471bf74396d2ee5e5ed2409caf172c24"
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
