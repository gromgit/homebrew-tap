class Pup < Formula
  desc "Parsing HTML at the command-line"
  homepage "https://github.com/gromgit/pup"
  url "https://github.com/gromgit/pup/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "939de10adb673381074e5210994b83e024905a232217380a162152aac534df67"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "52e62d65620d080745bc3ea1e9b7d27504b2f16ca0eede0efc4f29555799efab"
    sha256 cellar: :any_skip_relocation, ventura:       "063658a04da435c2ce4d34d6bfb80646bdd59e1dab1fd8558cd402f83bd76b4a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e495f69dbabb037fe7d751d4140dc656e38a881abf922371be1dd0fe5035bc3e"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = pipe_output("#{bin}/pup p text{}", "<body><p>Hello</p></body>", 0)
    assert_equal "Hello", output.chomp
  end
end
