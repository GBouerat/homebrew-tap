class Codemagic < Formula
  desc "A powerful CLI tool for Codemagic CI/CD service"
  homepage "https://github.com/GBouerat/codemagic-cli"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GBouerat/codemagic-cli/releases/download/v#{version}/codemagic-aarch64-apple-darwin.tar.gz"
      sha256 "70dafc49e23dc5aa9d44960038d4de6b3319a007c793a5b2d91499ebf2c023f7"
    else
      url "https://github.com/GBouerat/codemagic-cli/releases/download/v#{version}/codemagic-x86_64-apple-darwin.tar.gz"
      sha256 "aa19920232e9f8644357599d4110bac0f5609e0119a1011a19e9eb80d7c121bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GBouerat/codemagic-cli/releases/download/v#{version}/codemagic-aarch64-unknown-linux-musl.tar.gz"
      sha256 "480cac3762ee64c7fa1288097db8d6bed340a583d9bce17f46baccfa7288415c"
    else
      url "https://github.com/GBouerat/codemagic-cli/releases/download/v#{version}/codemagic-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9fa50ec9bab8d6940179743a6d363bfcddb614e57121ef3ae101fa1ed0061fe7"
    end
  end

  def install
    bin.install "codemagic"

    # Install shell completions directly from the compiled binary (bash & zsh)
    generate_completions_from_executable(bin/"codemagic", "completions", shells: [:bash, :zsh])
  end

  test do
    assert_match "codemagic #{version}", shell_output("#{bin}/codemagic --version")
  end
end
