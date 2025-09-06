class Pup < Formula
  desc "Parsing HTML at the command-line"
  homepage "https://github.com/gromgit/pup"
  url "https://github.com/gromgit/pup/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "cb36ca9a971288100f287eb66f47de2033f1de7e9ff81cefc5a78f532c8b250d"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "603de58d433c4651e1352ba73edb014f2a7b0c216c5c9908b65d03bccb954b87"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "96743105b35044604857599ad1690ec544aebf83db4452e89e7b62cde739c016"
    sha256 cellar: :any_skip_relocation, ventura:       "93e93b40251dc9c7b77f37deeea1d48426e2b07bdb241f233d0f739a5034bb4b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f4c801646123c6704b23f9d8736626dedcca146fd5d86df9d696f70e4f4637bf"
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
