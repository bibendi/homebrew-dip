class Dip < Formula
  VERSION = "5.0.0".freeze

  desc "dip CLI gives the native-like interaction with Docker-Compose applications"
  homepage "https://github.com/bibendi/dip"
  version VERSION
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bibendi/dip/releases/download/v#{VERSION}/dip-Darwin-x86_64"
    sha256 "32830d77b6905f200407d7db1ba94136d327c1847bd895b03d1187533afcb94c"
  elsif OS.linux?
    url "https://github.com/bibendi/dip/releases/download/v#{VERSION}/dip-Linux-x86_64"
    sha256 "500d1781aaa6297cdffe73d4d2f43c0d4a25eff8cde89b12098420521101b954"
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
