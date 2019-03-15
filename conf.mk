#
# Configuration file for a RASE database. Defines k-mer size resistance
# breakpoints for individual antibiotics and the order of antibiotics for
# plotting.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

#########
# INDEX #
#########

#db name
name=ngonorrhoeae-usa

# k-mer size, can contain multiple values
k=18

###############
# ANTIBIOTICS #
###############

antibiotics:=cfm cro cip azi

###############
# BREAKPOINTS #
###############

# ESC = extended-spectrum cephalosporin
cfm=0.250 # cefixime (CFX in the original paper, belongs to ESC)
cro=0.125 # ceftriaxone (CRO in the original paper, belongs to ESC)
cip=1.000 # ciprofloxacin (CIPRO in the original paper)
azi=2.000 # azithromycin (AZI in the original paper)


#############
# INIT MAKE #
#############

SHELL=/usr/bin/env bash -eo pipefail
export PATH := ../../scripts:../rase/src/rase:$(PATH)

.SECONDARY:
.SUFFIXES:
.PHONY: all clean cleanall help

all:

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean

cleanall: clean ## Clean all
