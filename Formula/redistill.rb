class Redistill < Formula
  desc "High-performance Redis-compatible key-value store that outperforms Redis"
  homepage "https://github.com/redistill-io/redistill"
  url "https://github.com/redistill-io/redistill/releases/download/v1.3.0/redistill-1.3.0-x86_64-apple-darwin.tar.gz"
  sha256 "98f2c39cb32fdbb4b6b08e1c5d2832074394324a82f298744760f9df73fbafd1"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.3.0/redistill-1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "98f2c39cb32fdbb4b6b08e1c5d2832074394324a82f298744760f9df73fbafd1"
    end

    if Hardware::CPU.arm?
      url "https://github.com/redistill-io/redistill/releases/download/v1.3.0/redistill-1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "ad27532ee82423718a858a4c77c630acc1d0930ad7babc14389324c6cc5ce2aa"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.3.0/redistill-1.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e8a5b42fdb6fc7c66ab9cad11b336f30ee2b3078aacc160689f03c9392535b39"
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
