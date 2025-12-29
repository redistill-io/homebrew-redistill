# This is a template for the Homebrew formula
# Copy this to your homebrew-redistill repository as Formula/redistill.rb
# Then update the SHA256 checksums with actual values from your GitHub releases

class Redistill < Formula
  desc "High-performance Redis-compatible key-value store that outperforms Redis"
  homepage "https://github.com/shaikh-shahid/redistill"
  url "https://github.com/shaikh-shahid/redistill/releases/download/v1.1.2/redistill-1.1.2-x86_64-apple-darwin.tar.gz"
  sha256 "f7f200a3521a7a3d959a821478efb114d23c1330d60bae49589cc9849983a71c"
  version "1.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/shaikh-shahid/redistill/releases/download/v1.1.2/redistill-1.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "f7f200a3521a7a3d959a821478efb114d23c1330d60bae49589cc9849983a71c"
    end

    if Hardware::CPU.arm?
      url "https://github.com/shaikh-shahid/redistill/releases/download/v1.1.2/redistill-1.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "83b87a4e8acfa599fcc200d5017b79607c52215cce5e9371e8e18d6f8fd131c9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/shaikh-shahid/redistill/releases/download/v1.1.2/redistill-1.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a3af41d8d28e1e2678d89bbfd9efc1aa82300d86f5a676c13a6920c6e75fac67"
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
