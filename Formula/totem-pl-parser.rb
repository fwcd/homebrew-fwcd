# Ported from https://gitlab.archlinux.org/archlinux/packaging/packages/totem-pl-parser/-/blob/main/PKGBUILD

class TotemPlParser < Formula
  desc "Simple GObject-based library to parse and save a host of playlist formats"
  homepage "https://gitlab.gnome.org/GNOME/totem-pl-parser"
  url "https://gitlab.gnome.org/GNOME/totem-pl-parser/-/archive/V_3_26_6/totem-pl-parser-V_3_26_6.tar.gz"
  version "3.26.6"
  sha256 "7219272a4863f823e2dd6d997e78d725de9e6071b1af1b478870f207731a8234"

  depends_on "glib"
  depends_on "libarchive"
  depends_on "libgcrypt"
  depends_on "libxml2"
  depends_on "gobject-introspection" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build

  # Disable --version-script linker flag on macOS
  # https://gitlab.gnome.org/GNOME/totem-pl-parser/-/merge_requests/51
  patch do
    url "https://gitlab.gnome.org/GNOME/totem-pl-parser/-/commit/97fe4c927867619bac9decf9cba19ea4df2f7f8a.patch"
    sha256 "afb6f421d6a96ab81bad3ec83f85f086f04dafa05fccead350f87aa7226b7fa1"
  end

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end
end
