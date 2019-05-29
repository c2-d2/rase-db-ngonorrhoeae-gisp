include ../*.mk

all: .complete

.complete:
	for x in contigs/*.fa; do\
		b=$$(basename $$x); \
		./remove_plasmids.sh $$x > $$b; \
	done
	touch .complete

clean:
	rm -f .complete *.fa
