class Dip < Formula
  desc "Docker Interaction Process"
  homepage "https://github.com/bibendi/dip"
  url "https://github.com/bibendi/dip.git",
      tag: "0.8.0",
      revision: "21d66c0dba4ff8b0230f01c537367ee7b89f2b61"

  depends_on "crystal-lang" => :build
  depends_on "libyaml"
  depends_on "bdw-gc"

  def install
    system("crystal", "build", "--release", "src/app.cr")
    bin.install "dip"
  end

  test do
    assert_match version.to_s, shell_output(bin/"dip version")
  end
end
