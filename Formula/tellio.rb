class Tellio < Formula
  desc "Owner-controlled peer-to-peer folder sync for the command line"
  homepage "https://tellio.dev"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/telliohq/homebrew-tellio/releases/download/v0.1.0/tellio-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "29a87741a251a3af6bc31b838a99a2ad79acf2ac717df92e066a39c93416a347"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/telliohq/homebrew-tellio/releases/download/v0.1.0/tellio-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "575cc163a9ab6ad91b5b49257c3848cae1926bbb4e0abeba75dbb1b237321924"
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
