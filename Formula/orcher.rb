class Orcher < Formula
  desc "The ORCHER command-line interface: run an engine, start and inspect workflows, on your machine or in ORCHER Cloud"
  homepage "https://github.com/orcher-io"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/orcher-io/cli/releases/download/v0.1.1/orcher-aarch64-apple-darwin.tar.xz"
      sha256 "b956da23166fd545ce6819736c5f6706861809aeb0b76635b36f864d24ca6c39"
    end
    if Hardware::CPU.intel?
      url "https://github.com/orcher-io/cli/releases/download/v0.1.1/orcher-x86_64-apple-darwin.tar.xz"
      sha256 "00d59fbc3e6c82f680672563daa92e029adfb59cb8380a8413a9ae63919f1e19"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/orcher-io/cli/releases/download/v0.1.1/orcher-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a0955facbdfc9698dbba12709c5630e5e7d6395638a556b58bf1078e1d777737"
    end
    if Hardware::CPU.intel?
      url "https://github.com/orcher-io/cli/releases/download/v0.1.1/orcher-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d164af4b9b6d808b90931731eb21c484c7b2036c47b33437e516b3110712ef95"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static": {},
    "x86_64-apple-darwin": {},
    "x86_64-pc-windows-gnu": {},
    "x86_64-unknown-linux-gnu": {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "orcher"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "orcher"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "orcher"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "orcher"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
