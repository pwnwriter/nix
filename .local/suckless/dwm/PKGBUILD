# Maintainer: pwnwriter 
# gmail:  <iym.nabeen@gmail.com>
# github: <github.com/pwnwriter>

pkgname=metis-dwm
pkgver=1.3
pkgrel=5
pkgdesc="DWM for metis-os"
url="https://github.com/metis-os/metis-dwm"
arch=('any')
license=('GPL3')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 
)
conflicts=('dwm')
provides=("${pkgname}")
options=(!strip !emptydirs)
install="${pkgname}.install"

prepare() {
	cp -af ../source/. ${srcdir}
}

build() {
  cd "$srcdir"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd "$srcdir"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D "$srcdir/scripts/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
  install -m755 -D "$srcdir/scripts/powermenu.sh" "$pkgdir/usr/local/bin/powermenu.sh"
  install -m755 -D "$srcdir/scripts/dmenu-theming" "$pkgdir/usr/local/bin/dmenu-theming"
  install -m755 -D "$srcdir/scripts/dmenu-websearch-sources" "$pkgdir/usr/local/bin/dmenu-websearch-sources"
  install -m755 -D "$srcdir/scripts/dmenu-websearch.sh" "$pkgdir/usr/local/bin/dmenu-websearch.sh"

}
