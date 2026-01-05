class Capacitor < Formula
  desc "Kubernetes GUI for GitOps with Flux and Helm"
  homepage "https://github.com/gimlet-io/capacitor"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gimlet-io/capacitor/releases/download/0.14.0/next-Darwin-arm64"
      sha256 "3fa6ad054c7994ab5de077423d4e8136c1023bc460d267f9d739f7eedff5320f"
    else
      odie "Only arm64 macOS builds are currently provided"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gimlet-io/capacitor/releases/download/0.14.0/next-Linux-x86_64"
      sha256 "aadc2232996e7f29c587d87c6a80a2f41f4e9722e1ec964d3188b57e1b296359"
    else
      odie "Only x86_64 Linux builds are currently provided"
    end
  end

  def install
    if OS.mac?
      bin.install "next-Darwin-arm64" => "capacitor"
    elsif OS.linux?
      bin.install "next-Linux-x86_64" => "capacitor"
    else
      odie "Unsupported platform for capacitor formula"
    end
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/capacitor version")
  end
end
