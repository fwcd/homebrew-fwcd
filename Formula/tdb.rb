# Based on https://github.com/Homebrew/homebrew-core/pull/45054 by @minusf

class Tdb < Formula
  desc "Trivial database library"
  homepage "https://tdb.samba.org"
  url "https://www.samba.org/ftp/tdb/tdb-1.4.9.tar.gz"
  sha256 "0ac226073e3a2db8648da7af744cb95f50766a52feeb001d558b2b321b74a765"

  depends_on "docbook" => :build
  depends_on "docbook-xsl" => :build
  depends_on "python" => :build

  def install
    ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"

    system "./configure", "--prefix=#{prefix}", "--disable-rpath"
    system "make", "test"
    system "make", "install"
  end
end
