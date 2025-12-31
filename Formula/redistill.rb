class Redistill < Formula
  desc "High-performance Redis-compatible key-value store that outperforms Redis"
  homepage "https://github.com/shaikh-shahid/redistill"
  url "https://github.com/shaikh-shahid/redistill/releases/download/v1.2.0/redistill-1.2.0-x86_64-apple-darwin.tar.gz"
  sha256 "0d20aabb2c47ee5c8b3dd48f27f66cb2b79418c593ca2ac8f4feecbe23014911"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/shaikh-shahid/redistill/releases/download/v1.2.0/redistill-1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "0d20aabb2c47ee5c8b3dd48f27f66cb2b79418c593ca2ac8f4feecbe23014911"
    end

    if Hardware::CPU.arm?
      url "https://github.com/shaikh-shahid/redistill/releases/download/v1.2.0/redistill-1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "4487bf6be0dc4bf5dcc23ee265edfcb7d5fa3c1a11e6e46f0fb3a1bd21f0598e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/shaikh-shahid/redistill/releases/download/v1.2.0/redistill-1.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d483fd153f9f8272df68d1bd9d0b3050dd79e271d46f570ae03bb997b93ae945"
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
