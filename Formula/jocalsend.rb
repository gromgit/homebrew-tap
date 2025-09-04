class Jocalsend < Formula
  desc "TUI LocalSend implementation"
  homepage "https://git.kittencollective.com/nebkor/joecalsend"
  url "https://git.kittencollective.com/nebkor/joecalsend/archive/1.61803398.tar.gz"
  sha256 "720909cf50f599f8b0144144b2d8a68b1c555f5eb668f224b81a547e84767221"
  license :cannot_represent

  livecheck do
    url "https://git.kittencollective.com/nebkor/joecalsend.git"
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
