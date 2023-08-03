class Nchat < Formula
  desc "Terminal-based Telegram / WhatsApp client for Linux and macOS"
  homepage "https://github.com/d99kris/nchat"
  url "https://github.com/d99kris/nchat/archive/refs/tags/v3.60.tar.gz"
  sha256 "8a382603d5e9ef1942f796995dc4652d9e9665d1dbcf55349461e81ecebf4bca"
  license "MIT"

  depends_on "gperf"
  depends_on "cmake"
  depends_on "openssl"
  depends_on "ncurses"
  depends_on "ccache"
  depends_on "readline"
  depends_on "help2man"
  depends_on "sqlite"
  depends_on "libmagic"
  depends_on "go"

  def install
    system "mkdir", "-p", "build"
    cd "build" do
      system "cmake", ".."
      system "make", "-s"
      bin.install "nchat"
    end
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  test do
    assert_predicate bin/"nchat", :executable?
    assert_match "nchat v3.64", shell_output("#{bin}/nchat --version")
  end
end
