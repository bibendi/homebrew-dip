class Dip < Formula
  desc "dip CLI gives the native-like interaction with Docker-Compose applications"
  homepage "https://github.com/bibendi/dip"
  version "3.8.3"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bibendi/dip/releases/download/v3.8.3/dip-Darwin-x86_64"
    sha256 "5c148a944318b4dafee18706a8084dc19cc15c556453845b1bd407a68018d464"
  elsif OS.linux?
    url "https://github.com/bibendi/dip/releases/download/v3.8.3/dip-Linux-x86_64"
    sha256 "6d95926ba8666fdf8a4cbfb0d7470ab907cd5ea8df368cff5a338ce8edc19bb4"
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
