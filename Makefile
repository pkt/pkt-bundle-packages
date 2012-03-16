changes=$(wildcard *.changes)
uploads=$(patsubst %.changes,%.ppa.upload,$(changes))

packages = $(wildcard pkt-bundle*)
release = `lsb_release -cs`

all: $(packages)
	@set -e; for p in $(packages); do cd $$p ; debuild -S -sa ; done

publish: $(uploads)

%.ppa.upload: %.changes
	@dput ppa:pktoss/testing $<

clean:
	@rm -f *.build *.changes *.deb *.dsc *.gz *.upload

.PHONY: all clean publish
