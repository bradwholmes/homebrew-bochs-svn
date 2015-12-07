class Bochs < Formula
  homepage "http://bochs.sourceforge.net/"
  desc "A highly portable open source IA-32 (x86) PC emulator written in C++"
  head "http://svn.code.sf.net/p/bochs/code/trunk/bochs/" 

  depends_on "pkg-config" => :build
  depends_on :x11
  depends_on "gtk+"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--with-x11",
                          "--enable-debugger",
                          "--enable-disasm",
                          "--disable-docbook",
                          "--enable-x86-64",
                          "--enable-pci",
                          "--enable-all-optimizations",
                          "--enable-plugins",
                          "--enable-cdrom",
                          "--enable-a20-pin",
                          "--enable-fpu",
                          "--enable-alignment-check",
                          "--enable-large-ramfile",
                          "--enable-debugger-gui",
                          "--enable-readline",
                          "--enable-iodebug",
                          "--enable-xpm",
                          "--enable-show-ips",
                          "--enable-logging",
                          "--enable-usb",
                          "--enable-ne2000",
                          "--enable-cpu-level=6",
                          "--enable-sb16",
                          "--enable-clgd54xx",
                          "--with-term",
                          "--enable-ne2000"

    system "make"
    system "make", "install"
  end

  test do
    system bin/"bochs", "--help"
  end
end
