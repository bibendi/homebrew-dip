class Dip < Formula
  VERSION = "6.1.0".freeze

  desc "dip CLI gives the native-like interaction with Docker-Compose applications"
  homepage "https://github.com/bibendi/dip"
  version VERSION
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bibendi/dip/releases/download/v#{VERSION}/dip-Darwin-x86_64"
    sha256 "d0ab691c000f2ca2e1d78ac6d43f14919b14d5944fb25f397138348d045fd081"
  elsif OS.linux?
    url "https://github.com/bibendi/dip/releases/download/v#{VERSION}/dip-Linux-x86_64"
    sha256 "f944f9f0a79b7ddfb272b34bd5812f2ae9b3d3611e36b41b2cb1c7e5359863ff"
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
