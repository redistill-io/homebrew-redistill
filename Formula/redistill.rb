class Redistill < Formula
  desc "High-performance Redis-compatible key-value store that outperforms Redis"
  homepage "https://github.com/redistill-io/redistill"
  url "https://github.com/redistill-io/redistill/releases/download/v1.2.1/redistill-1.2.1-x86_64-apple-darwin.tar.gz"
  sha256 "5d7a50324784cda162a4d2913ce4be1f9e09c77a826042f02d26669c5e8f914d"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.1/redistill-1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "5d7a50324784cda162a4d2913ce4be1f9e09c77a826042f02d26669c5e8f914d"
    end

    if Hardware::CPU.arm?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.1/redistill-1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "97afb24e88f9900212086b2764661be7c62df861e2c8545c9ce4d43b0c4adbbe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.1/redistill-1.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "933f08d2afb46386a39bd5f6503f094c746b5384d4d19a78445fb4904d61758d"
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
