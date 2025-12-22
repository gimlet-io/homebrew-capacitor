class Capacitor < Formula
  desc "Kubernetes GUI for GitOps with Flux and Helm"
  homepage "https://github.com/gimlet-io/capacitor"
  version "0.14.0-rc.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gimlet-io/capacitor/releases/download/0.14.0-rc.4/next-Darwin-arm64"
      sha256 "78c7ca095369dfeecd1598ea5bcac83427977b58c104d780524a287ad7da4fb3"
    else
      odie "Only arm64 macOS builds are currently provided"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gimlet-io/capacitor/releases/download/0.14.0-rc.4/next-Linux-x86_64"
      sha256 "fb030fba8ae1fe1e30e69b4804526dc427ac6e68749dd6073d8fe533a1d9a41c"
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
