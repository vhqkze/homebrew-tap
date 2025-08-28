class NeovimNightly < Formula
  desc "Ambitious Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io/"
  version "v0.12.0-dev-1104+ga33284c2c0"

  if Hardware::CPU.arm?
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz"
    sha256 "1d10f6cd7c6201881c55b943a06a4eb4a33a894a5156046ff2f03f42eafdd4df"
  else
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz"
    sha256 "b3eaaa00194441c51980bfb525e7fa6f7d0b848b410020cad40f836804f740fb"
  end

  depends_on :macos

  conflicts_with "neovim", because: "both install `nvim` binaries"

  def install
    prefix.install "bin", "share", "lib"
  end

  def caveats
    <<~EOS
      This is a nightly build of Neovim.
      It may be unstable and subject to frequent changes.
    EOS
  end

  test do
    assert_match "NVIM #{version}", shell_output("#{bin}/nvim --version")
  end
end
