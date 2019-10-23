class Dip < Formula
  VERSION = "4.1.0".freeze

  desc "dip CLI gives the native-like interaction with Docker-Compose applications"
  homepage "https://github.com/bibendi/dip"
  version VERSION
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bibendi/dip/releases/download/v#{VERSION}/dip-Darwin-x86_64"
    sha256 "a7ac1ada9db259cb4cb374e0388064531c98888dcbb2a049bd2f1b6b332af023"
  elsif OS.linux?
    url "https://github.com/bibendi/dip/releases/download/v#{VERSION}/dip-Linux-x86_64"
    sha256 "808464d3a847ef7b459e7ba59432f306ece4c7b092649d1786a3250a861e3b84"
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
