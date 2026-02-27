class NeovimNightly < Formula
  desc "Ambitious Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io/"
  version "v0.12.0-dev-2435+g18c5f06c9f"

  if Hardware::CPU.arm?
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz"
    sha256 "4553ef8524540de88b8654d87add63c99f8f9e2b97565c2f2056806342302dcf"
  else
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz"
    sha256 "bf67ee418c0c35d441b8a21de68eba163af66d619a65f6fcd25d59329ba577e8"
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
