class Orcher < Formula
  desc "The ORCHER command-line interface: run an engine, start and inspect workflows, on your machine or in ORCHER Cloud"
  homepage "https://github.com/orcher-io"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/orcher-io/cli/releases/download/v0.1.0/orcher-aarch64-apple-darwin.tar.xz"
      sha256 "f7227349912a3d9304a265709374d52040b48486330f7ecb90a06b6dcd63810f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/orcher-io/cli/releases/download/v0.1.0/orcher-x86_64-apple-darwin.tar.xz"
      sha256 "6e88a996b31ceac341f0f91a49fd3e01466899ea8cbadbe0d35fabdc01c73881"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/orcher-io/cli/releases/download/v0.1.0/orcher-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "42e1d7f5d038ad366faac2ffb708ab48ce0877a4be15a31969cca9938bf01116"
    end
    if Hardware::CPU.intel?
      url "https://github.com/orcher-io/cli/releases/download/v0.1.0/orcher-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "fc71b696a0186b0cfcb69cdf336b0337526f4a4d70527ccd15cfae08ef253dac"
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
