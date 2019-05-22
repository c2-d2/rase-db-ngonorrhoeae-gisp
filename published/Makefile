#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../*.mk

all: isolates.tsv

isolates.tsv: mlst.tsv table_s1.tsv
	./merge_and_clean.R

clean:
	rm -f .*.complete isolates.tsv

