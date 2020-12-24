DESTDIR ?= /
PREFIX_BIN ?= $(DESTDIR)/usr/bin
PREFIX_SERVICE ?= $(DESTDIR)/etc/systemd/system

.PHONY: usage
usage:
	@echo -e \
	  "\rTo install ups run make install. The default is to install the script\n" \
	  "\rto 'DESTDIR/usr/bin' and ups.service to 'DESTDIR/etc/systemd/system'\n" \
	  "\rwhere DESTDIR defaults to '/'. To change the default simply set\n" \
	  "\rDESTDIR to where you want it to be installed. Or change the prefix for\n" \
	  "\rbin and service:\n\n" \
	  "\rPREFIX_BIN: Where the ups scripts will end up. Default is:\n" \
	  "\r            DESTDIR/usr/bin.\n\n" \
	  "\rPREFIX_SERVICE: Where the ups systemd script will end up. Default is\n" \
	  "\r                DESTDIR/etc/systemd/system."

$(PREFIX_BIN):
	@install -d $@

$(PREFIX_SERVICE):
	@install -d $@

.PHONY: install bin service
install: bin service

bin: | $(PREFIX_BIN)
	install  scripts/ups.sh $|/ups

service: | $(PREFIX_SERVICE)
	install  scripts/ups.service $|/ups.service

