class Dip < Formula
  desc "Docker Interaction Process"
  homepage "https://github.com/bibendi/dip"
  url "https://github.com/bibendi/dip.git",
      tag: "0.8.1",
      revision: "9ff5dfa1403ec84ecc4983cc52401780cdad3a16"

  depends_on "crystal-lang" => :build
  depends_on "libyaml"
  depends_on "bdw-gc"

  def install
    system "crystal", "deps"
    system "crystal", "build", "--release", "src/app.cr"
    bin.install "src/dip"
  end

  test do
    assert_match version.to_s, shell_output(bin/"dip version")
  end
end
