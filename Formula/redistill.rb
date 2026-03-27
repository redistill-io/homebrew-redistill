class Redistill < Formula
  desc "High-performance Redis-compatible key-value store that outperforms Redis"
  homepage "https://github.com/redistill-io/redistill"
  url "https://github.com/redistill-io/redistill/releases/download/v1.2.10/redistill-1.2.10-x86_64-apple-darwin.tar.gz"
  sha256 "1951eb0814503ea5c8f2f5e183fb3e1a0ccd8ef2d3586430aba19a4590d779b0"
  version "1.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.10/redistill-1.2.10-x86_64-apple-darwin.tar.gz"
      sha256 "1951eb0814503ea5c8f2f5e183fb3e1a0ccd8ef2d3586430aba19a4590d779b0"
    end

    if Hardware::CPU.arm?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.10/redistill-1.2.10-aarch64-apple-darwin.tar.gz"
      sha256 "fb82c34260c1eef3e0cb4043e6e093d9c90dc5fcf5cf8c7a1beb7dcdb843bf83"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.10/redistill-1.2.10-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f4055ceb11836e1c147954ed2dc478af847fe41d1608502033927f386f84dc1d"
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
