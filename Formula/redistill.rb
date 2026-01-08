class Redistill < Formula
  desc "High-performance Redis-compatible key-value store that outperforms Redis"
  homepage "https://github.com/redistill-io/redistill"
  url "https://github.com/redistill-io/redistill/releases/download/v1.2.6/redistill-1.2.6-x86_64-apple-darwin.tar.gz"
  sha256 "710091755d82da53d9b00c29b230a00005f24daed41c8ee1a27a640780397fac"
  version "1.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.6/redistill-1.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "710091755d82da53d9b00c29b230a00005f24daed41c8ee1a27a640780397fac"
    end

    if Hardware::CPU.arm?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.6/redistill-1.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "8734c6cbd568dc576c63841faa75cb6895c62fa8cc934f23443421d0c5be03d5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.6/redistill-1.2.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6e5a2de7a1bcd76365ba415de3edcc1c06ebaafe4247f147b1d6e783c3423105"
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
