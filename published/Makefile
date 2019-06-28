#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../*.mk

all: isolates.tsv

isolates.tsv: mlst.tsv table_s1.tsv
	./01.correct-azm.R
	./02.merge_and_clean.R

clean:
	rm -f .*.complete isolates.tsv table_s1.corrected_azm.tsv


