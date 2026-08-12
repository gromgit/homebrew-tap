class Jocalsend < Formula
  desc "TUI LocalSend implementation"
  homepage "https://git.kittencollective.com/nebkor/joecalsend"
  url "https://git.kittencollective.com/nebkor/joecalsend/archive/1.6180339887.tar.gz"
  sha256 "be687bed51687ea628f2dadc04d16ee57d6efcb6f8e741b408b511fd66fa8526"
  license :cannot_represent

  livecheck do
    url "https://git.kittencollective.com/nebkor/joecalsend.git"
  end

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b9ca3578bb9d6e30b43bc4df505ce435c2206b87add3d5ca1f1c34862536c14d"
    sha256 cellar: :any,                 arm64_linux:  "e80cac026c89488315b3b1563ae7ea4323ccd54629b833d338a805117fb04932"
    sha256 cellar: :any,                 x86_64_linux: "fb3af03b5fbba44e3e3e71ee4cc3700dc18bf7b7f05cf84ecd5353be669487df"
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
