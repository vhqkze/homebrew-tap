class NeovimNightly < Formula
  desc "Ambitious Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io/"
  version "v0.13.0-dev-1474+gd42367570c"

  if Hardware::CPU.arm?
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz"
    sha256 "01c806e39639e40211556a675f2c5335d756575947d814b884796346bad5070d"
  else
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz"
    sha256 "d0b338acb0e8711eb95976ce9acce1e53db8a394b0017b32e13c57d6e0ff6e19"
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
