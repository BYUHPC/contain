DESTDIR ?= /usr

install:
	mkdir -p $(DESTDIR)/bin
	cp contain $(DESTDIR)/bin

.PHONY: install
