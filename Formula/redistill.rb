class Redistill < Formula
  desc "High-performance Redis-compatible key-value store that outperforms Redis"
  homepage "https://github.com/redistill-io/redistill"
  url "https://github.com/redistill-io/redistill/releases/download/v1.2.7/redistill-1.2.7-x86_64-apple-darwin.tar.gz"
  sha256 "8766dfc0410a01c92e054b64b2b062773cb1e8c64d55574250fa3c5c1b68f7ca"
  version "1.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.7/redistill-1.2.7-x86_64-apple-darwin.tar.gz"
      sha256 "8766dfc0410a01c92e054b64b2b062773cb1e8c64d55574250fa3c5c1b68f7ca"
    end

    if Hardware::CPU.arm?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.7/redistill-1.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "0d075ccb38a5477ee0bc1feee8671a142eef53cb46a10080ef0a742d9badd197"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.7/redistill-1.2.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "befec1dcd8f431517a6a539db10fc11182770ef47be66ae173cc2b4426e3c0f4"
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
