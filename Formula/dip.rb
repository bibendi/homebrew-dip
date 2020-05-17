class Dip < Formula
  VERSION = "6.0.0".freeze

  desc "dip CLI gives the native-like interaction with Docker-Compose applications"
  homepage "https://github.com/bibendi/dip"
  version VERSION
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bibendi/dip/releases/download/v#{VERSION}/dip-Darwin-x86_64"
    sha256 "d22b31869f49f8ccd04e38fec534d9970bcbab980e00853b400e47300638af8e"
  elsif OS.linux?
    url "https://github.com/bibendi/dip/releases/download/v#{VERSION}/dip-Linux-x86_64"
    sha256 "0e625c21ea6e0b54c8d79cae09aeda35f1a8979a32190d039e15d2bcf71cf45e"
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
