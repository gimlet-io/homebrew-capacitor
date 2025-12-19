class Capacitor < Formula
  desc "Kubernetes GUI for GitOps with Flux and Helm"
  homepage "https://github.com/gimlet-io/capacitor"
  version "0.14.0-rc.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gimlet-io/capacitor/releases/download/0.14.0-rc.3/next-Darwin-arm64"
      sha256 "7fac30917985b06d53dca9bf8103e936887fc294edd201eb4106523aa4596c1b"
    else
      odie "Only arm64 macOS builds are currently provided"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gimlet-io/capacitor/releases/download/0.14.0-rc.3/next-Linux-x86_64"
      sha256 "1bd878f441e654f5d42c185a46ed5b2c642ee98276e1c535cac28ceb989961b5"
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
