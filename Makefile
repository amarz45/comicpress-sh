PROG = comicpress
PROG_GUI = comicpress_gui
PREFIX = /usr/local
BINDIR = ${PREFIX}/bin
LICENSEDIR = ${PREFIX}/share/licenses/${PROG}

all: $(PROG) $(PROG_GUI)

install: install_cli install_gui install_license

install_cli:
	install -d ${DESTDIR}${BINDIR}
	install -m 755 ${PROG} ${DESTDIR}${BINDIR}/${PROG}

install_gui:
	install -d ${DESTDIR}${BINDIR}
	install -m 755 ${PROG_GUI} ${DESTDIR}${BINDIR}/${PROG_GUI}

install_license:
	install -d ${DESTDIR}${LICENSEDIR}
	install -m 644 LICENSE ${DESTDIR}${LICENSEDIR}/LICENSE

uninstall: uninstall_cli uninstall_gui uninstall_license

uninstall_cli:
	rm -f ${DESTDIR}${BINDIR}/${PROG}

uninstall_gui:
	rm -f ${DESTDIR}${BINDIR}/${PROG_GUI}

uninstall_license:
	rm -rf ${DESTDIR}${LICENSEDIR}

.PHONY: all install install_cli install_gui install_license uninstall uninstall_cli uninstall_gui uninstall_license
