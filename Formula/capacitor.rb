class Capacitor < Formula
  desc "Kubernetes GUI for GitOps with Flux and Helm"
  homepage "https://github.com/gimlet-io/capacitor"
  version "0.14.0-rc.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gimlet-io/capacitor/releases/download/0.14.0-rc.3/next-Darwin-arm64"
      sha256 "d9726bb96b5aa90c9a85e001c6194415de57a7e2766b6e0498cfcc3c9767ee3a"
    else
      odie "Only arm64 macOS builds are currently provided"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gimlet-io/capacitor/releases/download/0.14.0-rc.3/next-Linux-x86_64"
      sha256 "73bfee40409348b94a6b22c6ea5edadb4b7a02cf3dcf40b855c80342160d823b"
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
