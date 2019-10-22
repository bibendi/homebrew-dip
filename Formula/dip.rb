class Dip < Formula
  desc "dip CLI gives the native-like interaction with Docker-Compose applications"
  homepage "https://github.com/bibendi/dip"
  version "4.0.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bibendi/dip/releases/download/v4.0.1/dip-Darwin-x86_64"
    sha256 "de62898de3a7758853f5171c2b72f75d26ae8122120d4e88c4ad96d739e34100"
  elsif OS.linux?
    url "https://github.com/bibendi/dip/releases/download/v4.0.1/dip-Linux-x86_64"
    sha256 "be989489c97b5f7b59214fb4ebebdf4b79da797edbefc98607e3950fb7d0df30"
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
