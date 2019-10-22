class Dip < Formula
  desc "dip CLI gives the native-like interaction with Docker-Compose applications"
  homepage "https://github.com/bibendi/dip"
  version "4.0.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bibendi/dip/releases/download/v4.0.0/dip-Darwin-x86_64"
    sha256 "b494fe846dbd41862ca9a72728b1d6be879d6b1cc3bf6866448bdeb184c113c1"
  elsif OS.linux?
    url "https://github.com/bibendi/dip/releases/download/v4.0.0/dip-Linux-x86_64"
    sha256 "92d44b3832563926817f763e5d6c1c012c557b814ff0579cfd40bfe3a9bebed4"
  end

  def install
    bin.install "dip-#{os_name}-x86_64"

    mv bin/"dip-#{os_name}-x86_64", bin/"dip"
  end

  def os_name
    if OS.mac?
      "Darwin"
    elsif OS.linux?
      "Linux"
    else
      raise "Unknown OS!"
    end
  end

  test do
    assert_match version.to_s, shell_output(bin/"dip version")
  end
end
