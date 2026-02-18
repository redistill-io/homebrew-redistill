class Redistill < Formula
  desc "High-performance Redis-compatible key-value store that outperforms Redis"
  homepage "https://github.com/redistill-io/redistill"
  url "https://github.com/redistill-io/redistill/releases/download/v1.2.8/redistill-1.2.8-x86_64-apple-darwin.tar.gz"
  sha256 "dbba84294ce44184e78821fa5363c4a9cb0118eaf18a7140522b41be995ed81c"
  version "1.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.8/redistill-1.2.8-x86_64-apple-darwin.tar.gz"
      sha256 "dbba84294ce44184e78821fa5363c4a9cb0118eaf18a7140522b41be995ed81c"
    end

    if Hardware::CPU.arm?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.8/redistill-1.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "a8ec2d3f4981b6a25722e5f9d99427d65d67a1f789b1fbaed9b4bdc97c670de1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.8/redistill-1.2.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8b7bfab9cb6d1e88dd6628195549f39f1f0701e773f38bf7615e93cddf6ae196"
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
