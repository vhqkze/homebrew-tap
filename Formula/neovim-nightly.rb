class NeovimNightly < Formula
  desc "Ambitious Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io/"
  version "v0.13.0-dev-1418+gf97bcbdf77"

  if Hardware::CPU.arm?
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz"
    sha256 "01422c1ac786be931a794d69e65dead5f68b82412233c9d856ee227c7082bef5"
  else
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz"
    sha256 "3ad4c4b90b28156a04f1dc25000fbe8103e631335c9019a93715fc20db79eca2"
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
