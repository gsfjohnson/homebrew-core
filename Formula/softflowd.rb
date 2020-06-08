class Softflowd < Formula
  desc "Cisco NetFlow exporter"
  homepage "https://github.com/irino/softflowd"
  url "https://github.com/irino/softflowd/archive/softflowd-1.0.0.tar.gz"
  sha256 "98aa66026d730211b45fe89670cd6ce50959846d536880b82f5afbca6281e108"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libpcap"

  def install
    system "/usr/local/bin/autoreconf", "-if"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"softflowd", "-h"
    system bin/"softflowctl", "-h"
  end
end
