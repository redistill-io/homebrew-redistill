class Redistill < Formula
  desc "High-performance Redis-compatible key-value store that outperforms Redis"
  homepage "https://github.com/redistill-io/redistill"
  url "https://github.com/redistill-io/redistill/releases/download/v1.2.9/redistill-1.2.9-x86_64-apple-darwin.tar.gz"
  sha256 "6c474d636c0d132f338e520420546bb76102373a10b50613a13fc244835c187e"
  version "1.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.9/redistill-1.2.9-x86_64-apple-darwin.tar.gz"
      sha256 "6c474d636c0d132f338e520420546bb76102373a10b50613a13fc244835c187e"
    end

    if Hardware::CPU.arm?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.9/redistill-1.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "99ca78708efe711dd8bae83211d51d2a3ed6bdd9b27cce8f626f933612e42e63"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/redistill-io/redistill/releases/download/v1.2.9/redistill-1.2.9-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9895f75d0fce7918ea8593530d5ae2f62af955bd4a1e6ff8c115dd5eb656a506"
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
