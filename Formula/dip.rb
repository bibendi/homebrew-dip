class Dip < Formula
  VERSION = "4.2.0".freeze

  desc "dip CLI gives the native-like interaction with Docker-Compose applications"
  homepage "https://github.com/bibendi/dip"
  version VERSION
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bibendi/dip/releases/download/v#{VERSION}/dip-Darwin-x86_64"
    sha256 "f5b9193ca1e95b757786ff1dddd424e40876b5bc6596f48121eb9ae26fe78ccb"
  elsif OS.linux?
    url "https://github.com/bibendi/dip/releases/download/v#{VERSION}/dip-Linux-x86_64"
    sha256 "033089ca7fc9d5d89e630ecf9423921d7747f6d5be8f1bd4f19a329b888954d7"
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
