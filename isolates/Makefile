include ../*.mk

all: .complete

.complete:
	tar xvf ../published/gcgs-contigs.tar.gz --strip-components=1
	touch $@

clean:
	rm -f *.fa .complete

