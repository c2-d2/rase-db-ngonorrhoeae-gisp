#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../conf.mk

all: .contigs.complete .tree.complete

.contigs.complete:
	wget https://zenodo.org/record/2618836/files/gcgs-contigs.tar.gz
	touch $@

.tree.complete:
	wget https://zenodo.org/record/2603320/files/gcgs.tree.nw
	touch $@

clean:
	rm -f .*.complete gcgs-contigs.tar.gz gcgs.tree.nw

