class Tellio < Formula
  desc "Owner-controlled peer-to-peer folder sync for the command line"
  homepage "https://tellio.dev"
  version "0.1.3"
  license "MIT OR Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/telliohq/homebrew-tellio/releases/download/v0.1.3/tellio-0.1.3-aarch64-apple-darwin.tar.gz"
    sha256 "2e6ddc7f9284e3f0115cc30a75a3afb300f5183dd977aba090a4a67823bd207b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/telliohq/homebrew-tellio/releases/download/v0.1.3/tellio-0.1.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "39e409269978487bd681420d9ce13acec71d97d86e4206adf1b55a354043f8f5"
  else
    odie "Tellio prebuilt archives support Apple Silicon macOS and x86-64 Linux only."
  end

  def install
    bin.install "tellio", "telliod"
  end

  service do
    run [opt_bin/"telliod", "run"]
    environment_variables TELLIO_IDENTITY_MODE: "file"
    keep_alive true
    log_path var/"log/telliod.log"
    error_log_path var/"log/telliod.log"
  end

  def caveats
    <<~EOS
      Tellio is installed unsigned for the internal prototype. Run it with:
        tellio health
        tellio init <folder>
      Manage the background service with:
        brew services start tellio
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tellio --version")
  end
end
