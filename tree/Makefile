#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../*.mk

all: .complete

.complete:
	rase_db_tree_delete_node.py \
		-i ../published/gcgs.tree.nw \
		-o _tree.cleaned.newick \
		-d "8289_2#48" "8289_2#11"

	rase_db_prepare_tree.py \
		-i _tree.cleaned.newick\
		-o tree.newick \
		--metadata ../published/table_s1.tsv \
		--node-col 0 \
		--taxid-col 0 \
		--phylogroup-col 14

	touch $@

clean:
	rm -f _*.newick .complete

cleanall: clean
	rm -f *.newick
