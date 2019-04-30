#
# Create RASE metadata table from user-provided MICs and breakpoints.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

.PHONY: step1 step2 step3 step4 step5

include ../*.mk

all: .res_cat.complete

.res_cat.complete:
	$(MAKE) step1
	$(MAKE) step2
	$(MAKE) step3
	$(MAKE) step4
	$(MAKE) step5
	touch $@

step1: ## Print order of leaves to a file (to keep the same order everywhere)
	rase_db_tree_print_order.py -i ../tree/tree.newick > _leaves.tsv

step2: ## Sort metadata tables
	cat ../published/table_s1.tsv | sort_with_header.sh -k 1 > _isolates.tsv
	cut -f1 _isolates.tsv | tail -n +2 > _taxids.tsv
	cut -f12 _isolates.tsv | tail -n +2 | perl -pe 's/(-|new)/NA/g' > _ngmast.tsv
	cut -f15 _isolates.tsv | tail -n +2 > _phylogroups.tsv

step3: ## assign resistance categories (apply breakpoints)
	rase_db_assign_re_cat.py -i _isolates.tsv -t 0 -b $(azm) -m 4 -a azm > _res_cat.azm.tsv
	rase_db_assign_re_cat.py -i _isolates.tsv -t 0 -b $(cfm) -m 1 -a cfm > _res_cat.cfm.tsv
	rase_db_assign_re_cat.py -i _isolates.tsv -t 0 -b $(cip) -m 3 -a cip > _res_cat.cip.tsv
	rase_db_assign_re_cat.py -i _isolates.tsv -t 0 -b $(cro) -m 2 -a cro > _res_cat.cro.tsv

step4: ## Perform ancestral state reconstruction (infer missing resistance categories)
	for ant in $(antibiotics); do \
		echo "Ancestral state reconstruction: $$ant"; \
		rase_db_ancestral_state_reconstruction.py \
			--antibiotic "$$ant" \
			--in-tsv "_res_cat.$$ant.tsv" \
			--tree "../tree/tree.newick" \
			> __res_cat.$$ant.tsv; \
	done

step5: ## Assemble metadata file
	paste \
		<(echo "taxid"; cat _taxids.tsv) \
		<(echo "pg"; cat _phylogroups.tsv) \
		<(cut -f 2 _leaves.tsv) \
		<(echo "ng-mast"; cat _ngmast.tsv) \
		$(foreach ant, $(antibiotics),<(cut -f 2-4 __res_cat.$(ant).tsv) ) \
	> res_cat.tsv

clean:
	rm -f _*.{tsv,tsv} .*.complete *.pdf

cleanall:
	rm -f *.tsv
