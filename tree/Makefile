#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../conf.mk

all: .complete

.complete:
	rase_db_prepare_tree.py \
		--in-newick ../published/gcgs.tree.nw \
		--out-newick tree.newick \
		--metadata ../published/table_s1.tsv \
		--node-col 0 \
		--taxid-col 0 \
		--phylogroup-col 14

	touch $@

clean:
	rm -f _*.newick .complete

cleanall: clean
	rm -f *.newick
