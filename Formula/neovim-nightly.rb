class NeovimNightly < Formula
  desc "Ambitious Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io/"
  version "v0.12.0-dev-1134+g79bfeecdb4"

  if Hardware::CPU.arm?
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz"
    sha256 "15ccef957562e98dae1422f493b26d0c43b2660c970f069d3ad136a7492721bb"
  else
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz"
    sha256 "441bdd16532f18006a7018c87c4d09f8953b765e6ec0039d71d8d6853c6bbda6"
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
