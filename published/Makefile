#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../*.mk

all: .contigs.complete isolates.tsv

.contigs.complete:
	wget https://zenodo.org/record/2618836/files/gcgs-contigs.tar.gz
	touch $@

isolates.tsv: mlst.tsv table_s1.tsv
	./merge_and_clean.R

clean:
	rm -f .*.complete gcgs-contigs.tar.gz gcgs.tree.nw isolates.tsv

