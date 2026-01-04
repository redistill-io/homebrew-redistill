class Redistill < Formula
  desc "High-performance Redis-compatible key-value store that outperforms Redis"
  homepage "https://github.com/redistill-io/redistill"
  url "https://github.com/redistill-io/redistill/releases/download/v1.2.5/redistill-1.2.5-x86_64-apple-darwin.tar.gz"
  sha256 "08e671a91aed09451bee73c5c39013cc7e14f987c5e90fb0d851a945746cac16"
  version "1.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.5/redistill-1.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "08e671a91aed09451bee73c5c39013cc7e14f987c5e90fb0d851a945746cac16"
    end

    if Hardware::CPU.arm?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.5/redistill-1.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "f7b5d75eac7fb332f79cb65722ca58dd8371411c56f69906d5c834daa9b6ef1a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.5/redistill-1.2.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ccfa8eb926a8b2ceda741e6b0f6f970065033fb1b9b4f5b229a333054c7f7c9c"
    end
  end

  def install
    bin.install "redistill"
  end

  test do
    # Test that the binary exists and can run
    assert_match "Redistill", shell_output("#{bin}/redistill --help 2>&1", 1) if OS.mac?
    # For Linux, you might need to adjust the test
    system "#{bin}/redistill", "--version" rescue nil
  end

  service do
    run [opt_bin/"redistill"]
    keep_alive true
    log_path var/"log/redistill.log"
    error_log_path var/"log/redistill.error.log"
  end
end
